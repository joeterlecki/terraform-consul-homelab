data "terraform_remote_state" "acl_policies" {
  backend = "consul"
  config = {
    access_token = "62d30451-b0d4-da83-902a-88e35b8e7d2a"
    address = "consul.yinzerlabs.io"
    datacenter = "homelab"
    path = "terraform_state/consul_tf/acl_policies"
    scheme = "https"
  }
}

resource "consul_acl_token" "global_management_token" {
  description = "Bootstrap Token (Global Management)"
  policies = ["global-management"]
}

resource "consul_acl_token" "anonymous_token" {
  description = "Anonymous Token"
}

resource "consul_acl_token" "node_policy_token" {
  local = false
  description = "Node Policy Token"
  policies = [data.terraform_remote_state.acl_policies.outputs.node_policy_name]
}

resource "consul_acl_token" "client_svc_policy_token" {
  local = false
  description = "Client Svc token for registering services"
  policies = [data.terraform_remote_state.acl_policies.outputs.client_svc_policy_name]
}

resource "consul_acl_token" "terraform_iac_policy_token" {
  local = false
  description = "Terraform IAC Policy token for IAC tasks"
  policies = [data.terraform_remote_state.acl_policies.outputs.terraform_iac_policy_name]
}

resource "consul_acl_token" "vault_svc_policy_token" {
  local = false
  description = "Vault service token for Vault integration"
  policies = [data.terraform_remote_state.acl_policies.outputs.vault_svc_policy_name]
}

resource "consul_acl_token" "nomad_server_policy_token" {
  local = false
  description = "Nomad Server Policy Token"
  policies = [data.terraform_remote_state.acl_policies.outputs.nomad_server_policy_name]
}

resource "consul_acl_token" "nomad_client_policy_token" {
  local = false
  description = "Nomad Server Policy Token"
  policies = [data.terraform_remote_state.acl_policies.outputs.nomad_client_policy_name]
}