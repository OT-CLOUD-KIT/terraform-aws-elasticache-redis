cluster_id              = "my-redis"
engine                  = "redis"
redis_engine_version    = "7.0"
node_type               = "cache.t3.micro"
port                    = 6379

vpc_id                  = "vpc-0bfa15004ff55e107"
subnet_ids              = ["subnet-08a2aa30dbc179a2b", "subnet-0a49bf4221b5f0107"]
subnet_group_name       = "my-redis-subnet-group"

create_default_security_group = true
allowed_ingress_ports         = [6379]
allowed_ingress_cidr_blocks   = ["10.0.0.0/16"]
security_group_ids            = [] # Leave empty to create one inside the module

tags = {
  Environment = "dev"
  Project     = "redis-project"
  Owner       = "nikita"
}

parameter_group_enabled  = true
parameter_group_name     = ""  # Let the module create it automatically
redis_family             = "redis7"
parameter = []

cluster_mode                = "single_node"  # "single_node", "enabled", or "disabled"
at_rest_encryption_enabled  = false
transit_encryption_enabled  = false
auth_token                  = ""

automatic_failover_enabled  = false
multi_az_enabled            = false
apply_immediately           = true
num_node_groups             = 0
replicas_per_node_group     = 0
