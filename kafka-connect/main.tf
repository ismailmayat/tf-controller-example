terraform {
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}

//resource "kafka_acl" "kafka-connect-cluster" {
//  resource_name       = "*"
//  resource_type       = "Cluster"
//  acl_principal       = var.principal
//  acl_host            = "*"
//  acl_operation       = "Create"
//  acl_permission_type = "Allow"
//}

resource "kafka_acl" "kafka-connect-consumer-group" {
  resource_name       = "*"
  resource_type       = "Group"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}


resource "kafka_acl" "kafka-connect-status-read" {
  resource_name       = var.status-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka-connect-status-write" {
  resource_name       = var.status-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}


resource "kafka_acl" "kafka-connect-offsets-read" {
  resource_name       = var.offsets-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka-connect-offsets-write" {
  resource_name       = var.offsets-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka-connect-configs-read" {
  resource_name       = var.configs-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "kafka-connect-configs-write" {
  resource_name       = var.configs-topic
  resource_type       = "Topic"
  acl_principal       = var.principal
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}