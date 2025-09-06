


module "standalone_redis" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-elasticache-redis.git?ref=Feature"

  node_type = var.node_type
  engine    = var.engine
  port      = var.port

 owner = var.owner
  app     = var.app
  env     = var.env

  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.network.outputs.private_subnets

  create_default_security_group = var.create_default_security_group
  allowed_ingress_ports         = var.allowed_ingress_ports
  allowed_ingress_cidr_blocks   = var.allowed_ingress_cidr_blocks

  parameter_group_enabled = var.parameter_group_enabled
  redis_family            = var.redis_family
  parameter_group_name    = var.parameter_group_name

  parameter          = var.parameter
  region             = var.region
  security_group_ids = var.security_group_ids
}

