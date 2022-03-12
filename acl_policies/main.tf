resource "consul_acl_policy" "node_policy" {
  name        = "node-policy"
  datacenters = ["homelab"]
  description = "Consul Agent Node Policy"
  rules       = <<-RULE
agent_prefix "" {
  policy = "write"
}
node_prefix "" {
  policy = "write"
}
service_prefix "" {
  policy = "read"
}
session_prefix "" {
  policy = "read"
}
    RULE
}

resource "consul_acl_policy" "client_svc_policy" {
  name        = "client-svc-policy"
  datacenters = ["homelab"]
  description = "Consul Agent Client Policy to register services"
  rules       = <<-RULE
service_prefix "" {
  policy = "write"
}
    RULE
}

resource "consul_acl_policy" "terraform_iac_policy" {
  datacenters = ["homelab"]
  name  = "terraform-iac-policy"
  description = "ACL Policy for Terrafrom IAC Privileges"
  rules = <<-RULE
acl = "write"
agent_prefix "" {
    policy = "write"
}
event_prefix "" {
    policy = "write"
}
key_prefix "" {
    policy = "write"
}
keyring = "write"
node_prefix "" {
    policy = "write"
}
operator = "write"
mesh = "write"
query_prefix "" {
    policy = "write"
}
service_prefix "" {
    policy = "write"
    intentions = "write"
}
session_prefix "" {
    policy = "write"
}
RULE
}

resource "consul_acl_policy" "vault_svc_policy" {
  datacenters = ["homelab"]
  description = "Vault service policy"
  name  = "vault-service-policy"
  rules = <<-RULE
service "vault" {
  policy = "write"
}

key_prefix "vault/" {
  policy = "write"
}

agent_prefix "" {
  policy = "read"
}

session_prefix "" {
  policy = "write"
}
RULE
}

resource "consul_acl_policy" "nomad_server_policy" {
  datacenters = ["homelab"]
  description = "Nomad Server policy"
  name  = "nomad-server-policy"
  rules = <<RULE
agent_prefix "" {
  policy = "read"
}

node_prefix "" {
  policy = "read"
}

service_prefix "" {
  policy = "write"
}

acl = "write"


RULE
}

resource "consul_acl_policy" "nomad_client_policy" {
  datacenters = ["homelab"]
  name  = "nomad-client-policy"
  rules = <<RULE
agent_prefix "" {
  policy = "read"
}

node_prefix "" {
  policy = "read"
}

service_prefix "" {
  policy = "write"
}
RULE
}