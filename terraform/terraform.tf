terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "2.11.3"
    }
  }
}

variable "root_password" {
  type = string
}
