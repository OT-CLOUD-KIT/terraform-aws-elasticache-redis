module "elasticache" {
  source                    = "./elasticache"
  region                    = "ap-south-1"
  vpc_id                    = "vpc-047ed556c10585a19"
  subnet_ids                = ["subnet-034ba60278fe48ed1", "subnet-05341f07c88a51fcd"]
  subnet_group_name         = "example-elasticache-subnet-group"
  cluster_id                = "example-redis-cluster"
  engine                    = "redis"
  node_type                 = "cache.t3.medium"
  parameter_group_name      = "default.redis7"
  port                      = 6379
  create_default_security_group = true
  allowed_ingress_cidr_blocks  = ["0.0.0.0/0"]
  tags                      = {
    environment = "dev"
    project     = "example"
  }
}
