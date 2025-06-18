variable "cluster_id" {}
variable "engine" {
  default = "redis"
}
variable "node_type" {}
variable "port" {
  default = 6379
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "subnet_group_name" {}

variable "create_default_security_group" {
  type    = bool
  default = true
}
variable "allowed_ingress_ports" {
  type = list(number)
}
variable "allowed_ingress_cidr_blocks" {
  type = list(string)
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
}
variable "parameter" {
  type    = list(object({ name = string, value = string }))
  default = []
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
