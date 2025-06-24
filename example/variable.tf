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
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  validation {
    condition     = length(var.bu) <= 5
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 8 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.resource) <= 8
    error_message = "The resource name must be less than or equal to 8 characters."
  }
}

variable "tenant" {
  description = "Tenant name (e.g., app1, app2). Max 6 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.tenant) <= 6
    error_message = "The tenant name must be less than or equal to 6 characters."
  }
}

variable "enabled_features" {
  type    = list(string)
  default = []
}

variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters like !@#$%&*()-_=+[]{}<>:? in the generated name."
  type        = bool
}

variable "upper" {
  description = "Include uppercase characters in the generated name."
  type        = bool
}

variable "number" {
  description = "Include numbers in the generated name."
  type        = bool
}

variable "gen_no_of_names" {
  description = "Number of names to generate."
  type        = number
}

variable "team" {
  description = "The email address of the team who owns the application, ex:digitalops@gehealthcare.com"
  type        = string
}

variable "program" {
  description = "Name of the Program, For ex: OT, BP etc."
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}
