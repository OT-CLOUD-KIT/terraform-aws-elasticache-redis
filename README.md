# Terraform Module: ElastiCache-Redis

[![Opstree Solutions](https://img.cloudposse.com/150x150/https://github.com/opstree.png)](https://opstree.github.io/)  
[Opstree Solutions](https://opstree.github.io/)

 A lightweight, reusable Terraform module to provision a **standalone (single-node) Redis cache** using AWS ElastiCache.  
This module is ideal for **non-production environments** such as **development**, **testing**, or **low-availability workloads**, where replication, clustering, and multi-AZ setups are not required.

---

## Features

- Deploys a **single-node Redis ElastiCache**
- Supports optional **custom Redis parameter groups**
- Allows use of **custom or auto-created security groups**
- Designed for use in **VPCs with private subnets**
- Tags, subnet groups, and security rules are configurable


---
## Architecture 

![elasticCache drawio](https://github.com/user-attachments/assets/2c9a5dae-5331-4124-86b8-750a1d1e25d0)

___

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|
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


## Resources

The following resources are created by this module:

| Name | Type |
|------|------|
| [aws_elasticache_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | Creates a subnet group for ElastiCache using the specified subnet IDs |
| [aws_security_group.elasticache_security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | Creates a security group for the Redis cluster if `create_default_security_group` is true |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | Adds ingress rules to the ElastiCache security group for allowed ports and CIDRs |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | Adds a default egress rule to allow all outbound traffic |
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | Creates a custom Redis parameter group if enabled |
| [aws_elasticache_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | Provisions the ElastiCache Redis cluster with the provided settings |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input_cluster_id) | Unique identifier for the ElastiCache cluster | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input_node_type) | Node type defines the compute and memory capacity | `string` | `"cache.t3.micro"` | no |
| <a name="input_port"></a> [port](#input_port) | Port number on which Redis accepts connections | `number` | `6379` | no |
| <a name="input_engine"></a> [engine](#input_engine) | Redis engine type | `string` | `"redis"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input_vpc_id) | VPC ID where the cluster is deployed | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input_subnet_ids) | Subnet IDs for ElastiCache deployment | `list(string)` | n/a | yes |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input_subnet_group_name) | Subnet group name for ElastiCache | `string` | n/a | yes |
| <a name="input_create_default_security_group"></a> [create\_default\_security\_group](#input_create_default_security_group) | Whether to create a default security group | `bool` | `true` | no |
| <a name="input_allowed_ingress_ports"></a> [allowed\_ingress\_ports](#input_allowed_ingress_ports) | List of ingress ports allowed | `list(number)` | `[6379]` | no |
| <a name="input_allowed_ingress_cidr_blocks"></a> [allowed\_ingress\_cidr\_blocks](#input_allowed_ingress_cidr_blocks) | List of allowed CIDR blocks for ingress | `list(string)` | `["10.0.0.0/16"]` | no |
| <a name="input_parameter_group_enabled"></a> [parameter\_group\_enabled](#input_parameter_group_enabled) | Whether to enable custom parameter group | `bool` | `true` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input_parameter_group_name) | Name of the parameter group | `string` | `""` | no |
| <a name="input_redis_family"></a> [redis\_family](#input_redis_family) | Redis engine family | `string` | `"redis7"` | no |
| <a name="input_parameter"></a> [parameter](#input_parameter) | List of Redis parameter group settings | `list(map(string))` | `[]` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input_security_group_ids) | Security group IDs to associate (empty for default) | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Resource tags | `map(string)` | `{ Environment = "dev", Owner = "nikita" }` | no |

---


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_cluster_id"></a> [redis\_cluster\_id](#output_redis_cluster_id) | The ID of the created ElastiCache Redis cluster |
| <a name="output_redis_endpoint"></a> [redis\_endpoint](#output_redis_endpoint) | The primary endpoint address of the ElastiCache Redis cluster |
| <a name="output_security_group_id"></a> [security\_group\_id](#output_security_group_id) | The ID of the security group associated with the Redis cluster |


---


## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)
