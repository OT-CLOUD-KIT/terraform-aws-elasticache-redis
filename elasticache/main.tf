provider "aws" {
  region = var.region
}

# Subnet Group
resource "aws_elasticache_subnet_group" "this" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = var.subnet_group_name
    }
  )
}

# Security Group
resource "aws_security_group" "elasticache_security" {
  count = var.create_default_security_group ? 1 : 0

  name_prefix = "${var.cluster_id}-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_id}-sg"
    }
  )
}

# Parameter Group
resource "aws_elasticache_parameter_group" "default" {
  count  = var.parameter_group_enabled && var.parameter_group_name == "" ? 1 : 0
  name   = "parameter-group-${var.cluster_id}${var.cluster_mode == "enabled" ? "-cluster-on" : ""}"
  family = var.redis_family

  dynamic "parameter" {
    for_each = var.cluster_mode == "enabled" ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

# Replication Group for Cluster Mode Disabled or Enabled
resource "aws_elasticache_replication_group" "redis" {
  count = var.cluster_mode != "single_node" ? 1 : 0

  replication_group_id = "${var.cluster_id}-replication"
  description          = "Redis replication group for ${var.cluster_id}"
  node_type            = var.node_type
  engine               = var.engine
  engine_version       = var.redis_engine_version
  parameter_group_name = length(aws_elasticache_parameter_group.default) > 0 ? aws_elasticache_parameter_group.default[0].name : var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = coalesce(var.security_group_ids, [aws_security_group.elasticache_security[0].id])
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                = var.transit_encryption_enabled ? var.auth_token : null
  automatic_failover_enabled = var.cluster_mode != "disabled" && var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled
  apply_immediately          = var.apply_immediately
  num_node_groups            = var.cluster_mode == "enabled" ? var.num_node_groups : 1
  replicas_per_node_group    = var.cluster_mode == "enabled" ? var.replicas_per_node_group : 0

  tags = merge({ "Provisioned" = "Terraform" }, var.tags)
}


# Single Node Cluster
resource "aws_elasticache_cluster" "single_node" {
  count = var.cluster_mode == "single_node" ? 1 : 0

  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = length(aws_elasticache_parameter_group.default) > 0 ? aws_elasticache_parameter_group.default[0].name : var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = coalesce(var.security_group_ids, [aws_security_group.elasticache_security[0].id])

  tags = merge(
    var.tags,
    {
      Name = var.cluster_id
    }
  )
}