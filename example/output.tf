output "redis_primary_endpoint" {
  value = module.elasticache.primary_endpoint_address
}

output "redis_reader_endpoint" {
  value = module.elasticache.reader_endpoint_address
}

output "redis_security_groups" {
  value = module.elasticache.security_group_ids
}
