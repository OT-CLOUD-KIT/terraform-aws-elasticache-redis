output "cluster_mode" {
  value = var.cluster_mode
}

output "subnet_group_name" {
  value = aws_elasticache_subnet_group.this.name
}

output "security_group_ids" {
  value = var.security_group_ids != [] ? var.security_group_ids : aws_security_group.elasticache_security[*].id
}

output "replication_group_id" {
  value = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].id : null
}

output "primary_endpoint_address" {
  value = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].primary_endpoint_address : null
}

output "reader_endpoint_address" {
  value = length(aws_elasticache_replication_group.redis) > 0 ? aws_elasticache_replication_group.redis[0].reader_endpoint_address : null
}

output "single_node_endpoint" {
  value = length(aws_elasticache_cluster.single_node) > 0 ? aws_elasticache_cluster.single_node[0].cache_nodes[0].address : null
}
