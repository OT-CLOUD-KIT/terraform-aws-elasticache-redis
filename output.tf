output "security_group_id" {
  value = var.create_default_security_group ? aws_security_group.elasticache_security[0].id : null
}

output "subnet_group_name" {
  value = aws_elasticache_subnet_group.this.name
}

output "cluster_id" {
  value = var.cluster_mode == "single_node" ? aws_elasticache_cluster.single_node[0].cluster_id : aws_elasticache_replication_group.redis[0].replication_group_id
}
