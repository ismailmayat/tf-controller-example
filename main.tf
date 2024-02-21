terraform {
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}


provider "kafka" {
  bootstrap_servers = ["kafka.confluent.svc.cluster.local:9092"]
  ca_cert      = "ca.pem"
  client_cert  = "cert.pem"
  client_key   = "key.pem"
  skip_tls_verify   = true
}

resource "kafka_acl" "test" {
  resource_name       = "syslog"
  resource_type       = "Topic"
  acl_principal       = "User:Alice"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Deny"
}

resource "kafka_acl" "topic-a" {
  resource_name       = "topic-a"
  resource_type       = "Topic"
  acl_principal       = "User:Bob"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Deny"
}

resource "kafka_acl" "topic-aa" {
  resource_name       = "topic-a"
  resource_type       = "Topic"
  acl_principal       = "User:Alice"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Deny"
}

resource "kafka_acl" "topic-ismail" {
  resource_name       = "ismail-test"
  resource_type       = "Topic"
  acl_principal       = "User:Ismail"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Deny"
}

resource "kafka_topic" "ismail-test" {
  name               = "ismail-test"
  replication_factor = 4
  partitions         = 4

  config = {
    "segment.ms"   = "4000"
    "retention.ms" = "86400000"
  }

  depends_on = [kafka_acl.topic-ismail]
}

module "kafka-connect" {
  source = "./kafka-connect"
  principal = "User:connect"
  status-topic = "confluent.connect-status"
  offsets-topic = "confluent.connect-offsets"
  configs-topic = "confluent.connect-configs"
}

module "schema-registry" {
  source = "./schema-registry"
  principal = "User:schemaregistry"
  schemas-topic = "_schemas_schemaregistry_confluent"
}