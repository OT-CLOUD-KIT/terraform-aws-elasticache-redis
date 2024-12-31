variable "region" {
  description = "AWS Region where resources will be provisioned."
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID where the ElastiCache cluster will be deployed."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache cluster's subnet group."
  type        = list(string)
}

variable "subnet_group_name" {
  description = "The name of the ElastiCache subnet group."
  type        = string
  default     = "default-elasticache-subnet-group"
}

variable "cluster_id" {
  description = "Identifier for the ElastiCache cluster."
  type        = string
}

variable "engine" {
  description = "The name of the ElastiCache engine (e.g., redis or memcached)."
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "The instance type of the ElastiCache node (e.g., cache.t3.medium)."
  type        = string
  default     = "cache.t3.micro"
}

variable "parameter_group_name" {
  description = "The name of the ElastiCache parameter group."
  type        = string
  default     = "default.redis6.x"
}

variable "port" {
  description = "The port number on which the ElastiCache instance accepts connections."
  type        = number
  default     = 6379
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ElastiCache cluster."
  type        = list(string)
  default     = []
}

variable "allowed_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the ElastiCache cluster (used when creating the default security group)."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "create_default_security_group" {
  description = "Whether to create a default security group for the ElastiCache cluster."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
