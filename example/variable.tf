##################################
# AWS & Networking Configuration #
##################################

variable "region" {
  description = "AWS region where the ElastiCache module should be deployed."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where ElastiCache resources will reside."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to include in the ElastiCache subnet group."
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name to assign to the ElastiCache subnet group."
  type        = string
}

###############################
# ElastiCache Cluster Details #
###############################

variable "cluster_id" {
  description = "Unique ID for the ElastiCache cluster or replication group."
  type        = string
}

variable "cluster_mode" {
  description = "Cluster mode: single_node, disabled, or enabled."
  type        = string
}

variable "redis_engine_version" {
  description = "Version of Redis engine (e.g., 7.1, 6.x)."
  type        = string
}

variable "num_node_groups" {
  description = "Number of node groups (shards) for cluster mode = enabled."
  type        = number
}

variable "replicas_per_node_group" {
  description = "Number of replicas per shard (node group)."
  type        = number
}

#####################################
# Security & Access Configuration  #
#####################################

variable "security_group_ids" {
  description = "Optional list of existing security group IDs. Leave empty to create a default one."
  type        = list(string)
}

variable "allowed_ingress_cidr_blocks" {
  description = "CIDR blocks allowed to access Redis if default security group is created."
  type        = list(string)
}

##########################################
# Availability, Failover, and Behavior  #
##########################################

variable "automatic_failover_enabled" {
  description = "Enable automatic failover (recommended for production)."
  type        = bool
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ deployment for high availability."
  type        = bool
}

variable "apply_immediately" {
  description = "Apply changes immediately or wait for the next maintenance window."
  type        = bool
}

#################
# Tagging Setup #
#################

variable "tags" {
  description = "Tags to apply to all created resources."
  type        = map(string)
}
