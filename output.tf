output "redis_cluster_id" {
  value = aws_elasticache_cluster.this.id
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.this.cache_nodes[0].address
}

output "security_group_id" {
  value       = aws_security_group.elasticache_security[0].id
  description = "Security group created by the module"
#   condition   = var.create_default_security_group
}
