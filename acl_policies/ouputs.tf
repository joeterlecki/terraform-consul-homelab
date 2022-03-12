output "node_policy_id" {
  value = consul_acl_policy.node_policy.id
}

output "node_policy_name" {
  value = consul_acl_policy.node_policy.name
}

output "client_svc_policy_id" {
  value = consul_acl_policy.client_svc_policy.id
}

output "client_svc_policy_name" {
  value = consul_acl_policy.client_svc_policy.name
}

output "terraform_iac_policy_id" {
  value = consul_acl_policy.terraform_iac_policy.id
}

output "terraform_iac_policy_name" {
  value = consul_acl_policy.terraform_iac_policy.name
}

output "vault_svc_policy_id" {
  value = consul_acl_policy.vault_svc_policy.id
}

output "vault_svc_policy_name" {
  value = consul_acl_policy.vault_svc_policy.name
}

output "nomad_server_policy_name" {
  value = consul_acl_policy.nomad_server_policy.name
}

output "nomad_server_policy_id" {
  value = consul_acl_policy.nomad_server_policy.id
}

output "nomad_client_policy_id" {
  value = consul_acl_policy.nomad_client_policy.id
}

output "nomad_client_policy_name" {
  value = consul_acl_policy.nomad_server_policy.name
}