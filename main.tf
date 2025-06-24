
# Elasticache Subnet Group
resource "aws_elasticache_subnet_group" "this" {
  name       = "${local.base_name}-subnetgrp"
  subnet_ids = var.subnet_ids

  tags = merge(local.common_tags, {
    Name = "${local.base_name}-subnetgrp"
  })
}

# Elasticache Security Group
resource "aws_security_group" "elasticache_security" {
  count       = var.create_default_security_group ? 1 : 0
  name_prefix = "${local.base_name}-sg"
  vpc_id      = var.vpc_id

  tags = merge(local.common_tags, {
    Name = "${local.base_name}-sg"
  })
}

# Ingress Rules for Elasticache SG
resource "aws_security_group_rule" "ingress" {
  count = var.create_default_security_group ? length(var.allowed_ingress_ports) * length(var.allowed_ingress_cidr_blocks) : 0

  type              = "ingress"
  from_port         = var.allowed_ingress_ports[floor(count.index / length(var.allowed_ingress_cidr_blocks))]
  to_port           = var.allowed_ingress_ports[floor(count.index / length(var.allowed_ingress_cidr_blocks))]
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_ingress_cidr_blocks[count.index % length(var.allowed_ingress_cidr_blocks)]]
  security_group_id = aws_security_group.elasticache_security[0].id
}

# Egress Rules for Elasticache SG
resource "aws_security_group_rule" "egress" {
  count = var.create_default_security_group ? 1 : 0

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elasticache_security[0].id
}

# Elasticache Parameter Group
resource "aws_elasticache_parameter_group" "this" {
  count  = var.parameter_group_enabled && var.parameter_group_name == "" ? 1 : 0
  name   = "pg-${local.base_name}"
  family = var.redis_family

  dynamic "parameter" {
    for_each = var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = merge(local.common_tags, {
    Name = "pg-${local.base_name}"
  })
}

# Elasticache Cluster
resource "aws_elasticache_cluster" "this" {
  cluster_id           = "${local.base_name}-cluster"
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = 1
  port                 = var.port
  parameter_group_name = var.parameter_group_enabled && var.parameter_group_name == "" ? aws_elasticache_parameter_group.this[0].name : var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = var.security_group_ids != [] ? var.security_group_ids : [aws_security_group.elasticache_security[0].id]

  tags = merge(local.common_tags, {
    Name = "${local.base_name}-cluster"
  })
}
