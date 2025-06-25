# variable "cluster_id" {}
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
# variable "subnet_group_name" {}

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

# variable "tags" {
#   type    = map(string)
#   default = {}
# }


################################### Naming convention variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string

  validation {
    condition     = length(var.bu) <= 10
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
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

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
}