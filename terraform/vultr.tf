provider "vultr" {
  rate_limit  = 700
  retry_limit = 3
}

resource "vultr_instance" "node" {
  count = 3

  plan   = "vc2-1c-1gb"
  region = "sgp"
  os_id  = 387
}
