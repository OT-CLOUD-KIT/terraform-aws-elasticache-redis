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

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string
  default = "bp"

  validation {
    condition     = length(var.bu) <= 10
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
  default = "ot"
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string


  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string
  default = "d"

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
  default = "infra"
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default = "us-east-1"
} 