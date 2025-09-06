node_type = "cache.t3.micro"
engine    = "redis"
port      = 6379

create_default_security_group = true
allowed_ingress_ports         = [6379]
allowed_ingress_cidr_blocks   = ["10.0.0.0/16"]
parameter_group_enabled       = false
parameter_group_name          = "default.redis7"
parameter                     = []

redis_family = "redis7"

region = "us-east-1"

################# Naming Convension #####################

env = "dev"
owner = "opstree"
app = "ot-cloud-kit"

