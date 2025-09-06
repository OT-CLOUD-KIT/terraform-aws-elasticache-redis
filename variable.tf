# variable "cluster_id" {}
variable "engine" {
  default = "redis"


}
variable "node_type" {
  default = "cache.t3.micro"
}
variable "port" {
  default = 6379
}

variable "vpc_id" {
  default = "vpc-0bfa15004ff55e107"
}
variable "subnet_ids" {
  type = list(string)
  default = [ "subnet-08a2aa30dbc179a2b" , "subnet-0a49bf4221b5f0107" ]
}

variable "create_default_security_group" {
  type    = bool
  default = true
}
variable "allowed_ingress_ports" {
  type = list(number)
  default = [ 6379 ]
}
variable "allowed_ingress_cidr_blocks" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

variable "parameter_group_enabled" {
  type    = bool
  default = false
}
variable "parameter_group_name" {
  type    = string
  default = ""
}
variable "redis_family" {
  type = string
  default = "redis7"
}
variable "parameter" {
  type    = list(object({ name = string, value = string }))
  default = []
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}




################################### Naming convention variables #########################################
variable "env" {
  type = string
  default = "dev"
  
}

variable "owner" {
  type = string
  default = "opstree"
}

variable "app" {
  type = string
  default = "otcloud-kit"
  
}