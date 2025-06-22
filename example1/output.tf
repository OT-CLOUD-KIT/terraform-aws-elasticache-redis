output "redis_cluster_id" {
  description = "The ID of the standalone Redis cluster"
  value       = module.standalone_redis.redis_cluster_id
}

output "redis_endpoint" {
  description = "The endpoint address of the Redis cluster"
  value       = module.standalone_redis.redis_endpoint
}

output "security_group_id" {
  description = "The security group ID created for Redis"
  value       = module.standalone_redis.security_group_id
}
