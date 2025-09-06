


module "standalone_redis" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-elasticache-redis.git?ref=Feature"

  node_type  = var.node_type
  engine     = var.engine
  port       = var.port
  owner= var.owner
  app        = var.app
  env        = var.env
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  create_default_security_group = var.create_default_security_group
  allowed_ingress_ports         = var.allowed_ingress_ports
  allowed_ingress_cidr_blocks   = var.allowed_ingress_cidr_blocks

  parameter_group_enabled = var.parameter_group_enabled
  parameter_group_name    = var.parameter_group_name
  redis_family            = var.redis_family
  parameter               = var.parameter

  security_group_ids = var.security_group_ids
}

