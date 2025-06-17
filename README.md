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

---
## Architecture 
![image](https://github.com/user-attachments/assets/88bc9637-acb4-4520-a7b3-f74adc8e0190)


## Providers
| Name | Version |
|------|---------|
|Terraform |  >= 1.12.1|
|aws | 5.82.2 |

___

## Usage

```hcl
module "elasticache" {
  source = "../"

  cluster_id                   = var.cluster_id
  engine                       = var.engine
  redis_engine_version         = var.redis_engine_version
  node_type                    = var.node_type
  port                         = var.port
  vpc_id                       = var.vpc_id
  subnet_ids                   = var.subnet_ids
  subnet_group_name            = var.subnet_group_name
  create_default_security_group = var.create_default_security_group
  allowed_ingress_ports        = var.allowed_ingress_ports
  allowed_ingress_cidr_blocks  = var.allowed_ingress_cidr_blocks
  security_group_ids           = var.security_group_ids
  tags                         = var.tags

  parameter_group_enabled      = var.parameter_group_enabled
  parameter_group_name         = var.parameter_group_name
  redis_family                 = var.redis_family
  parameter                    = var.parameter

  cluster_mode                 = var.cluster_mode
  at_rest_encryption_enabled   = var.at_rest_encryption_enabled
  transit_encryption_enabled   = var.transit_encryption_enabled
  auth_token                   = var.auth_token
  automatic_failover_enabled   = var.automatic_failover_enabled
  multi_az_enabled             = var.multi_az_enabled
  apply_immediately            = var.apply_immediately
  num_node_groups              = var.num_node_groups
  replicas_per_node_group      = var.replicas_per_node_group
}
```
> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.


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


## Contributor

- Piyush Upadhyay
- Nikita Joshi
