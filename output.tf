output "instance_ip_addr" {
  value = proxmox_vm_qemu.test_server.ipconfig0
}