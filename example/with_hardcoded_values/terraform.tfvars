
node_type = "cache.t3.micro" ## Node type defines the compute and memory capacity

port   = 6379
engine = "redis"

vpc_id     = "vpc-0bfa15004ff55e107"
subnet_ids = ["subnet-08a2aa30dbc179a2b", "subnet-0a49bf4221b5f0107"]

create_default_security_group = true
allowed_ingress_ports         = [6379]
allowed_ingress_cidr_blocks   = ["10.0.0.0/16"]

parameter_group_enabled = true
parameter_group_name    = ""
redis_family            = "redis7"
parameter               = []

security_group_ids = [] ## leave blank for auto created SG

region = "us-east-1"
################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "elastic cache"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "devops"
program = "ot"