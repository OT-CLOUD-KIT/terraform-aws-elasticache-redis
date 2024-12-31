variable "region" {
  description = "AWS region for the resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ElastiCache cluster."
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the ElastiCache cluster."
  type        = list(string)
}

variable "cluster_id" {
  description = "Cluster ID for the ElastiCache cluster."
  type        = string
}

variable "engine" {
  description = "Engine for the ElastiCache cluster (e.g., redis)."
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Instance type for the ElastiCache nodes."
  type        = string
  default     = "cache.t3.micro"
}

variable "port" {
  description = "Port for the ElastiCache cluster."
  type        = number
  default     = 6379
}

variable "cluster_mode" {
  description = "Cluster mode: single_node, disabled, or enabled."
  type        = string
  default     = "single_node"
  validation {
    condition = contains(["single_node", "disabled", "enabled"], var.cluster_mode)
    error_message = "Invalid value for cluster_mode. Must be 'single_node', 'disabled', or 'enabled'."
  }
}

variable "num_node_groups" {
  description = "Number of node groups for sharded mode."
  type        = number
  default     = 2
}

variable "replicas_per_node_group" {
  description = "Number of replicas per node group."
  type        = number
  default     = 1
}

variable "parameter_group_enabled" {
  description = "Enable a custom parameter group."
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Custom parameter group name."
  type        = string
  default     = ""
}

variable "parameter" {
  description = "List of custom parameters."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest."
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = "Enable in-transit encryption."
  type        = bool
  default     = false
}

variable "auth_token" {
  description = "Authentication token for Redis."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}


variable "subnet_group_name" {
  description = "Name of the ElastiCache subnet group."
  type        = string
}

variable "create_default_security_group" {
  description = "Whether to create a default security group."
  type        = bool
  default     = true
}

variable "allowed_ingress_cidr_blocks" {
  description = "CIDR blocks allowed to access the ElastiCache cluster."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "redis_family" {
  description = "Redis family version for the parameter group."
  type        = string
  default     = "redis6.x"
}
# Redis Engine Version
variable "redis_engine_version" {
  description = "The version of the Redis engine to be used for the ElastiCache cluster."
  type        = string
  default     = "6.x"
}

# Security Group IDs
variable "security_group_ids" {
  description = "List of security group IDs to associate with the ElastiCache cluster. If empty, a default security group is created."
  type        = list(string)
  default     = []
}

# Automatic Failover Enabled
variable "automatic_failover_enabled" {
  description = "Specifies whether automatic failover is enabled for the replication group."
  type        = bool
  default     = false
}

# Multi-AZ Enabled
variable "multi_az_enabled" {
  description = "Specifies whether Multi-AZ is enabled for the replication group."
  type        = bool
  default     = false
}

# Apply Changes Immediately
variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}
