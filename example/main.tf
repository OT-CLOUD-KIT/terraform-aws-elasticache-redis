module "elasticache" {
  source = "../"

  region                      = var.region
  subnet_group_name           = var.subnet_group_name
  vpc_id                      = var.vpc_id
  subnet_ids                  = var.subnet_ids
  cluster_id                  = var.cluster_id
  cluster_mode                = var.cluster_mode
  redis_engine_version        = var.redis_engine_version
  security_group_ids          = var.security_group_ids
  automatic_failover_enabled  = var.automatic_failover_enabled
  multi_az_enabled            = var.multi_az_enabled
  apply_immediately           = var.apply_immediately
  num_node_groups             = var.num_node_groups
  replicas_per_node_group     = var.replicas_per_node_group
  allowed_ingress_cidr_blocks = var.allowed_ingress_cidr_blocks
  tags                        = var.tags
}
