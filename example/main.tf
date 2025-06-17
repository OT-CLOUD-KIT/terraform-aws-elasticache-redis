module "elasticache" {
  source = "../"

  cluster_id                   = var.cluster_id
  engine                       = var.engine
  redis_engine_version         = var.redis_engine_version
  node_type                    = var.node_type
  port                         = var.port
  vpc_id                       = var.vpc_id
  subnet_ids                   = var.subnet_ids
  subnet_group_name            = var.subnet_group_name
  create_default_security_group = var.create_default_security_group
  allowed_ingress_ports        = var.allowed_ingress_ports
  allowed_ingress_cidr_blocks  = var.allowed_ingress_cidr_blocks
  security_group_ids           = var.security_group_ids
  tags                         = var.tags

  parameter_group_enabled      = var.parameter_group_enabled
  parameter_group_name         = var.parameter_group_name
  redis_family                 = var.redis_family
  parameter                    = var.parameter

  cluster_mode                 = var.cluster_mode
  at_rest_encryption_enabled   = var.at_rest_encryption_enabled
  transit_encryption_enabled   = var.transit_encryption_enabled
  auth_token                   = var.auth_token
  automatic_failover_enabled   = var.automatic_failover_enabled
  multi_az_enabled             = var.multi_az_enabled
  apply_immediately            = var.apply_immediately
  num_node_groups              = var.num_node_groups
  replicas_per_node_group      = var.replicas_per_node_group
}
