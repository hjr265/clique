---
all:
  hosts:
%{ for i, host in hosts ~}
    ${host.name}:
      pipelining: true
      ansible_ssh_user: root
      ansible_ssh_pass: ${host.root_password}
      ansible_host: ${host.host}
      ansible_ssh_port: ${host.ssh_port}

%{ endfor ~}
wireguard:
  hosts:
%{ for i, host in hosts ~}
%{ if can(host.wireguard_ip) ~}
    ${host.name}:
      wireguard_ip: ${host.wireguard_ip}
      wireguard_addrs:
%{ if can(host.host_wan) ~}
        wan: ${host.host_wan}:51871
%{ endif ~}
%{ if can(host.host_lan) ~}
        lan: ${host.host_lan}:51871
%{ endif ~}
      wireguard_port: 51871
      wireguard_zone: ${host.zone}

%{ endif ~}
%{ endfor ~}
  vars:
    ansible_become_method: su

    wireguard_mask_bits: 16
    wireguard_port: 51871
