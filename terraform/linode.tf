provider "linode" {}

resource "linode_instance" "node" {
  count = 3

  region = "ap-south"
  type   = "g6-nanode-1"
  image  = "linode/ubuntu20.04"

  booted     = true
  private_ip = true

  root_pass = var.root_password
}
