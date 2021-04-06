variable "server_type" {
  default = "cx21"
}

variable "location" {
  default = "nbg1"
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "hcloud_token" {
  type = string
}

variable "image" {
  default = "ubuntu-20.04"
}

variable "user_data_template" {
  default = "docker"
}
