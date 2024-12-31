output "cluster_id" {
  description = "The identifier of the ElastiCache cluster."
  value       = aws_elasticache_cluster.this.id
}

# output "cluster_endpoint" {
#   description = "The endpoint address of the ElastiCache cluster."
#   value       = aws_elasticache_cluster.this.endpoint
# }

output "port" {
  description = "The port number of the ElastiCache cluster."
  value       = aws_elasticache_cluster.this.port
}

output "security_group_ids" {
  description = "The security group IDs associated with the ElastiCache cluster."
  value       = aws_elasticache_cluster.this.security_group_ids
}

output "subnet_group_name" {
  description = "The name of the ElastiCache subnet group."
  value       = aws_elasticache_subnet_group.this.name
}
