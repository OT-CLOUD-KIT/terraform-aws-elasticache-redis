

variable "node_type" {
  description = "The compute and memory capacity of the Redis node."
  type        = string
}

variable "engine" {
  description = "The name of the cache engine (e.g., redis)."
  type        = string

}

variable "port" {
  description = "The port number on which the Redis service will accept connections."
  type        = number
}

# vpc_id and subnet_ids are fetched from remote state, so no need to define them here.


variable "create_default_security_group" {
  description = "Whether to create a default security group for Redis."
  type        = bool
  default     = true
}

variable "allowed_ingress_ports" {
  description = "List of allowed ingress ports for Redis."
  type        = list(number)
}

variable "allowed_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access Redis."
  type        = list(string)
}

variable "parameter_group_enabled" {
  description = "Whether to enable a custom parameter group."
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Name of the custom parameter group (if enabled)."
  type        = string
  default     = null
}

variable "redis_family" {
  description = "The Redis family to use for the parameter group (e.g., redis6.x, redis7)."
  type        = string
}

variable "parameter" {
  description = "List of Redis parameters to set in the parameter group."
  type        = list(map(string))
  default     = []
}

variable "security_group_ids" {
  description = "List of existing security group IDs to associate with Redis (if any)."
  type        = list(string)
  default     = []
}



################## Naming convention variables ###################
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
