terraform {
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}

resource "kafka_acl" "schema-registry-schemas-configs" {
  resource_name       = var.schemas-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "DescribeConfigs"
  acl_permission_type = "Allow"
}


resource "kafka_acl" "schema-registry-schemas-read" {
  resource_name       = var.schemas-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}



resource "kafka_acl" "schema-registry-schemas-write" {
  resource_name       = var.schemas-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}


