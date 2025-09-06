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

variable "create_default_security_group" {
  type = bool
}
variable "allowed_ingress_ports" {
  type = list(number)
}
variable "allowed_ingress_cidr_blocks" {
  type = list(string)
}

variable "parameter_group_enabled" {
  type = bool
}
variable "parameter_group_name" {
  default = ""
}
variable "redis_family" {}
variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "security_group_ids" {
  default = []
}



################# Naming convention variables ###################

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
variable "region" {
  description = "AWS region (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}
