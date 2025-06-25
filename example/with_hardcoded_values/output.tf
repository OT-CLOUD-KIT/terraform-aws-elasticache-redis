output "redis_cluster_id" {
  value = module.standalone_redis.redis_cluster_id
}

output "redis_endpoint" {
  value = module.standalone_redis.redis_endpoint
}

output "security_group_id" {
  value = module.standalone_redis.security_group_id
}
