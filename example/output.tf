output "elasticache_cluster_id" {
  value = module.elasticache.cluster_id
}
output "elasticache_security_group" {
  value = module.elasticache.security_group_id
}
output "elasticache_subnet_group" {
  value = module.elasticache.subnet_group_name
}
