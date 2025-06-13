##############################
# AWS Region & Networking
##############################

region            = "us-east-1"
vpc_id            = "vpc-0bfa15004ff55e107"
subnet_ids        = ["subnet-08a2aa30dbc179a2b", "subnet-0a49bf4221b5f0107"]
subnet_group_name = "my-redis-subnet-group-1"

##############################
# ElastiCache Cluster
##############################

cluster_id              = "my-redis-cluster-v2"
cluster_mode            = "enabled"
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

automatic_failover_enabled = true
multi_az_enabled           = true
apply_immediately          = true

##############################
# Tagging
##############################

tags = {
  Environment = "Production"
  Application = "prodApp"
}
