##############################
# AWS Region & Networking
##############################

region            = "us-east-1"
vpc_id            = "vpc-0bfa15004ff55e107"
subnet_ids        = ["subnet-08a2aa30dbc179a2b", "subnet-0a49bf4221b5f0107"]
subnet_group_name = "redis-subnet-group"

##############################
# ElastiCache Cluster
##############################

cluster_id              = "redis-cluster"
cluster_mode            = "single_node"
redis_engine_version    = "7.1"
num_node_groups         = 1
replicas_per_node_group = 1

##############################
# Security Settings
##############################

security_group_ids          = [] # Leave blank to auto-create
allowed_ingress_cidr_blocks = ["10.0.0.0/16"]

##############################
# Availability Settings
##############################

automatic_failover_enabled = false
multi_az_enabled           = false
apply_immediately          = true

##############################
# Tagging
##############################

tags = {
  Environment = "Production"
  Application = "redisapp"
}
