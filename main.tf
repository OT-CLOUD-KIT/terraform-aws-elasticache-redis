module "elasticache" {
  source                     = "./elasticache"
  region                     = "ap-south-1"
  subnet_group_name          = "my-subnet-group"
  vpc_id                     = "vpc-047ed556c10585a19"
  subnet_ids                 = ["subnet-034ba60278fe48ed1", "subnet-05341f07c88a51fcd"]
  cluster_id                 = "my-redis-cluster"
  cluster_mode               = "enabled"
  redis_engine_version       = "7.1"
  security_group_ids         = []
  automatic_failover_enabled = true
  multi_az_enabled           = true
  apply_immediately          = true
  tags = {
    Environment = "Production"
    Application = "ExampleApp"
  }
}
