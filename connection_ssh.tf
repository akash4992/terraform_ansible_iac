locals {
  private_key_path = "/home/ansible/.ssh/id_rsa"

}
resource "null_resource" "web" {
  connection {
    type        = "ssh"
    user        = data.vault_generic_secret.ansible_auth.data["ansible_user"]
    host        = "192.168.5.73"
    private_key = file("/home/ansible/.ssh/id_rsa")
    timeout     = "20m"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
  }
  provisioner "local-exec" {
    command = "ansible-playbook nginx.yml"
  }
}
