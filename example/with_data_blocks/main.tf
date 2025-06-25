
module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.region
  env     = var.env
}


module "standalone_redis" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-elasticache-redis.git?ref=Feature"

  node_type = var.node_type
  engine    = var.engine
  port      = var.port

  bu      = var.bu
  program = var.program
  team    = var.team
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

