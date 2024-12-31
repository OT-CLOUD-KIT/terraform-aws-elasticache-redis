output "cluster_mode" {
  description = "The cluster mode used for the ElastiCache cluster."
  value       = var.cluster_mode
}

output "subnet_group_name" {
  description = "Name of the ElastiCache subnet group."
  value       = aws_elasticache_subnet_group.this.name
}

output "security_group_ids" {
  description = "Security group IDs associated with the ElastiCache cluster."
  value       = var.security_group_ids != [] ? var.security_group_ids : aws_security_group.elasticache_security[*].id
}

output "replication_group_id" {
  description = "The ID of the replication group (if applicable)."
  value       = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].id : null
}

output "primary_endpoint_address" {
  description = "The primary endpoint address of the replication group."
  value       = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].primary_endpoint_address : null
}

output "reader_endpoint_address" {
  description = "The reader endpoint address of the replication group."
  value       = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].reader_endpoint_address : null
}


output "single_node_endpoint" {
  description = "The endpoint for the single-node cluster."
  value       = length(aws_elasticache_cluster.single_node) > 0 ? aws_elasticache_cluster.single_node[0].cache_nodes[0].address : null
}
