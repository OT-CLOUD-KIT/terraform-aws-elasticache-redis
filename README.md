# Terraform Module: ElastiCache-Redis

[![Opstree Solutions](https://img.cloudposse.com/150x150/https://github.com/opstree.png)](https://opstree.github.io/)  
[Opstree Solutions](https://opstree.github.io/)

 A lightweight and reusable Terraform module to provision a **standalone Redis instance** using AWS ElastiCache. Best suited for dev/test environments where replication and clustering are not required.

---

##  Features

- Deploys **a single-node Redis cluster** using `aws_elasticache_cluster`
- Supports **custom parameter groups**
- Allows **custom or default security groups**
- Works with **VPC and private subnets**
- Optional **encryption**, **snapshot retention**, and **maintenance windows**

---
## Architecture 

## Usage

```hcl
module "elasticache" {
  source = "../"

  region                      = var.region
  subnet_group_name           = var.subnet_group_name
  vpc_id                      = var.vpc_id
  subnet_ids                  = var.subnet_ids
  cluster_id                  = var.cluster_id
  cluster_mode                = var.cluster_mode
  redis_engine_version        = var.redis_engine_version
  security_group_ids          = var.security_group_ids
  automatic_failover_enabled  = var.automatic_failover_enabled
  multi_az_enabled            = var.multi_az_enabled
  apply_immediately           = var.apply_immediately
  num_node_groups             = var.num_node_groups
  replicas_per_node_group     = var.replicas_per_node_group
  allowed_ingress_cidr_blocks = var.allowed_ingress_cidr_blocks
  tags                        = var.tags
}

```

## Input Variables

| Name                            | Description                                                         | Type     | Default            | Required |
| ------------------------------- | ------------------------------------------------------------------- | -------- | ------------------ | -------- |
| `cluster_id`                    | The Redis replication group identifier (must be unique)             | `string` | n/a                |  Yes    |
| `redis_engine_version`          | Redis engine version (e.g., `7.1`)                                  | `string` | `"7.1"`            |  yes     |
| `node_type`                     | Instance type for the nodes (e.g., `cache.t3.micro`)                | `string` | n/a                | Yes    |
| `port`                          | Redis port                                                          | `number` | `6379`             |  No     |
| `subnet_ids`                    | List of subnet IDs for deployment                                   | `list`   | n/a                |  Yes    |
| `vpc_id`                        | VPC ID for the Redis cluster                                        | `string` | n/a                |  Yes    |
| `parameter_group_name`          | Redis parameter group name                                          | `string` | `"default.redis7"` |  No     |
| `create_default_security_group` | Whether to auto-create a default security group                     | `bool`   | `true`             |  No     |
| `allowed_ingress_cidr_blocks`   | List of allowed CIDR blocks for Redis access                        | `list`   | `[]`               | No     |
| `apply_immediately`             | Apply changes immediately on update                                 | `bool`   | `true`             |  No     |
| `cluster_mode`                  | Whether to enable cluster mode (`enabled` or `disabled`)            | `string` | `"disabled"`       |  No     |
| `num_node_groups`               | Number of node groups (shards) – required if `cluster_mode=enabled` | `number` | `1`                |  No     |
| `replicas_per_node_group`       | Number of replicas per node group                                   | `number` | `1`                |  No     |
| `tags`                          | Tags to apply to all resources                                      | `map`    | `{}`               |  No     |


##  Outputs

| Name                | Description                                  |
|---------------------|----------------------------------------------|
| `redis_endpoint`    | DNS endpoint of the standalone Redis node    |
| `security_group_id` | Security group ID used by the Redis cluster  |

---


