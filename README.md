# Clique - Demo for Private and Secure Multi-Cloud Network with WireGuard

This demo illustrates how you may set up WireGuard to create a private and secure multi-cloud network. An accompanying article goes into details of this setup: https://hjr265.me/blog/private-secure-multi-cloud-network-wireguard

Please note that this demo and the article only outline the process of automating the setup process of WireGuard. Neither this demo nor the article is a comprehensive server and/or network hardening guide. We recommend you follow all the usual best practices and use this as a tutorial for only automating the WireGuard setup.

## Instructions

``` sh
# First, Terraform stuff...
cd terraform

# Initialize Terraform
terraform init

# Create .env
cp env-sample.txt .env
nano .env # Provide values for LINODE_TOKEN, VULTR_API_KEY, TF_VAR_root_password

# Apply Terraform: create 3 servers on Linode and 3 servers on Vultr, and a
# hosts.yml (Ansible inventory) file for Ansible to use in the next step.
dotenv run terraform apply

# Then, Ansible stuff...
cd ../ansible

# Run Ansible Playbook: install WireGuard, generate keys, set up WireGuard
# using Systemd Network.
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../terraform/hosts.yml wireguard.yml
```
