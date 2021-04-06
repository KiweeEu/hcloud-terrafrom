terraform {
  required_providers {
    hcloud = {
      source  = "registry.terraform.io/hetznercloud/hcloud"
      version = "1.25.2"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_ssh_keys" "all_keys" {
}

output "template" {
  value = var.user_data_template
}

# Create a new server
resource "hcloud_server" "server" {
  name = format("%s-%s", var.name, var.env)
  image = var.image
  server_type = var.server_type
  location = var.location
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  user_data = templatefile(format("templates/user_data_%s.yaml.tpl", var.user_data_template), {
    ssh_pub_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.public_key
    name = var.name
    env = var.env
  })
}
