resource "proxmox_vm_qemu" "test_server" {
  name        = "gitlab-new"
  target_node = "proxmoxserver"
  clone       = "UbuntuVm"
  full_clone  = true
}






