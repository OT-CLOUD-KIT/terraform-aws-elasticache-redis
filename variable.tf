##################################
# AWS & Networking Configuration #
##################################

variable "region" {
  description = "AWS region to deploy resources into."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ElastiCache will be deployed."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the ElastiCache subnet group."
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name of the ElastiCache subnet group."
  type        = string
}

##########################
# ElastiCache Parameters #
##########################

variable "cluster_id" {
  description = "Identifier for the ElastiCache cluster or replication group."
  type        = string
}

variable "engine" {
  description = "The cache engine to use. Default is 'redis'."
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Instance type for the cache nodes."
  type        = string
  default     = "cache.t3.micro"
}

variable "port" {
  description = "Port number for Redis. Default is 6379."
  type        = number
  default     = 6379
}

variable "redis_engine_version" {
  description = "Version of the Redis engine to use."
  type        = string
  default     = "7.x"
}

variable "redis_family" {
  description = "Redis parameter group family (e.g., redis6.x, redis7)."
  type        = string
  default     = "redis6.x"
}

######################
# Cluster Mode Setup #
######################

variable "cluster_mode" {
  description = "ElastiCache cluster mode: single_node, disabled, or enabled."
  type        = string
  default     = "single_node"
  validation {
    condition     = contains(["single_node", "disabled", "enabled"], var.cluster_mode)
    error_message = "Must be one of: single_node, disabled, or enabled."
  }
}

variable "num_node_groups" {
  description = "Number of node groups (shards) for cluster mode enabled."
  type        = number
  default     = 2
}

variable "replicas_per_node_group" {
  description = "Number of replicas per node group (shard)."
  type        = number
  default     = 1
}

#################################
# Security & Access Parameters #
#################################

variable "create_default_security_group" {
  description = "Whether to create a default security group for ElastiCache access."
  type        = bool
  default     = true
}

variable "allowed_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access ElastiCache (used in default SG)."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs to associate. If empty and default SG is enabled, one will be created."
  type        = list(string)
  default     = []
}

variable "auth_token" {
  description = "Authentication token (password) for Redis (used when encryption in transit is enabled)."
  type        = string
  default     = null
}

#####################################
# Encryption & High Availability   #
#####################################

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest for the replication group."
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = "Enable encryption in transit for the replication group."
  type        = bool
  default     = false
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover for Multi-AZ setup."
  type        = bool
  default     = false
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ for high availability."
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply changes immediately or during maintenance window."
  type        = bool
  default     = true
}

##########################
# Parameter Group Config #
##########################

variable "parameter_group_enabled" {
  description = "Whether to create a custom parameter group."
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Name of an existing parameter group to use (if not creating one)."
  type        = string
  default     = ""
}

variable "parameter" {
  description = "List of custom Redis parameters to apply if a new parameter group is created."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

#################
# Tagging Setup #
#################

variable "tags" {
  description = "Map of tags to assign to all resources."
  type        = map(string)
  default     = {}
}
