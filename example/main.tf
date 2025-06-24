module "standalone_redis" {
  source = "../"

  # cluster_id           = var.cluster_id
  node_type  = var.node_type
  engine     = var.engine
  port       = var.port
  bu         = var.bu
  program    = var.program
  team       = var.team
  app        = var.app
  env        = var.env
  region     = var.region
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