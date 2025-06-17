
variable "cluster_id" {
  description = "Unique identifier for the ElastiCache cluster"
  type        = string
}

variable "engine" {
  description = "ElastiCache engine type (e.g., redis)"
  type        = string
  default     = "redis"
}

variable "redis_engine_version" {
  description = "Version of the Redis engine (e.g., 7.0)"
  type        = string
}

variable "node_type" {
  description = "The instance class to be used for the cache nodes (e.g., cache.t3.micro)"
  type        = string
}

variable "port" {
  description = "Port to access Redis"
  type        = number
  default     = 6379
}


variable "vpc_id" {
  description = "The ID of the VPC to launch the cluster in"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ElastiCache subnet group"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name for the ElastiCache subnet group"
  type        = string
}




variable "create_default_security_group" {
  description = "Whether to create a default security group"
  type        = bool
  default     = true
}

variable "allowed_ingress_ports" {
  description = "List of allowed ingress ports"
  type        = list(number)
  default     = [6379]
}

variable "allowed_ingress_cidr_blocks" {
  description = "List of allowed CIDR blocks for ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_ids" {
  description = "List of custom security group IDs (if not using default SG)"
  type        = list(string)
  default     = []
}




variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}




variable "parameter_group_enabled" {
  description = "Whether to create a custom Redis parameter group"
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Name of the parameter group to use (optional)"
  type        = string
  default     = ""
}

variable "redis_family" {
  description = "Redis family to use for parameter group (e.g., redis7)"
  type        = string
}

variable "parameter" {
  description = "List of Redis parameter objects with name and value"
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
  description = "Number of shards (used when cluster_mode is 'enabled')"
  type        = number
  default     = 1
}

variable "replicas_per_node_group" {
  description = "Number of replicas per shard (used when cluster_mode is 'enabled')"
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
  description = "Password for Redis AUTH (required if transit encryption is enabled)"
  type        = string
  default     = ""
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover for Redis replication group"
  type        = bool
  default     = false
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ for high availability"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply changes immediately or during the next maintenance window"
  type        = bool
  default     = true
}
