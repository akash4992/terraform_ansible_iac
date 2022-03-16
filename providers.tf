terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}
provider "vault" {
  skip_tls_verify = true
  address         = "https://192.168.5.72:8200"
  token           = "s.rfKP5PRmLGiL5ub2sEDyhKGb"
}
provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.5.70:8006/api2/json"
  pm_user         = data.vault_generic_secret.proxmox_auth.data["proxmox_user"]
  pm_password     = data.vault_generic_secret.proxmox_auth.data["proxmox_passwd"]
  pm_timeout      = 600
}

