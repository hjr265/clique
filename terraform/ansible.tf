resource "local_file" "ansible_inventory" {
  content = templatefile("hosts.tpl", {
    hosts = concat(
      [for i, v in linode_instance.node : { name = v.label, root_password = var.root_password, host = v.ip_address, zone = "linode-ap-south", host_wan = v.ip_address, host_lan = v.private_ip_address, ssh_port = 22, wireguard_ip = "10.15.0.${i + 1}" }],
      [for i, v in vultr_instance.node : { name = v.label != null ? v.label : "vultr-node-${i + 1}", root_password = v.default_password, host = v.main_ip, zone = "vultr-sgp", host_wan = v.main_ip, ssh_port = 22, wireguard_ip = "10.15.1.${i + 1}" }],
    )
  })
  filename = "hosts.yml"
}
