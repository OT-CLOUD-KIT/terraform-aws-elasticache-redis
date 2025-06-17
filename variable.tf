
variable "cluster_id" {
  description = "Unique identifier for the ElastiCache cluster"
  type        = string
}

variable "engine" {
  description = "ElastiCache engine type (only Redis is supported in this module)"
  type        = string
  default     = "redis"
}

variable "redis_engine_version" {
  description = "Redis engine version to use (e.g., 7.0)"
  type        = string
}

variable "node_type" {
  description = "Instance type for the Redis nodes (e.g., cache.t3.micro)"
  type        = string
}

variable "port" {
  description = "Port to access Redis"
  type        = number
  default     = 6379
}


variable "vpc_id" {
  description = "VPC ID where Redis will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Redis subnet group"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name for the Redis subnet group"
  type        = string
}


variable "create_default_security_group" {
  description = "Whether to create a default security group"
  type        = bool
  default     = true
}

variable "allowed_ingress_ports" {
  description = "Ports to allow for ingress traffic"
  type        = list(number)
  default     = [6379]
}

variable "allowed_ingress_cidr_blocks" {
  description = "CIDR blocks allowed to access Redis"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_ids" {
  description = "Custom security group IDs to associate with the Redis cluster"
  type        = list(string)
  default     = []
}



variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}



variable "parameter_group_enabled" {
  description = "Enable creation of a custom parameter group"
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Custom parameter group name to use (leave blank to auto-create)"
  type        = string
  default     = ""
}

variable "redis_family" {
  description = "Redis parameter group family (e.g., redis7)"
  type        = string
}

variable "parameter" {
  description = "List of Redis parameters to apply if creating a custom parameter group"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}


variable "cluster_mode" {
  description = "Cluster mode: 'single_node', 'disabled' (replication), or 'enabled' (sharding)"
  type        = string
  default     = "single_node"
}

variable "num_node_groups" {
  description = "Number of shards (only used when cluster_mode = 'enabled')"
  type        = number
  default     = 1
}

variable "replicas_per_node_group" {
  description = "Number of replicas per shard (only used when cluster_mode = 'enabled')"
  type        = number
  default     = 1
}



variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest"
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = "Enable encryption in transit"
  type        = bool
  default     = false
}

variable "auth_token" {
  description = "Auth token for Redis AUTH (required if transit encryption is enabled)"
  type        = string
  default     = ""
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover (ignored for single_node)"
  type        = bool
  default     = false
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ deployment (only used with replication group)"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = true
}
