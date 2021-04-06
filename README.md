# Hetzner Cloud Virtual Machine Provisioning with Terraform

A simple solution to provision servers in Hetzner Cloud with user-defined templates.

## Prerequisites
* Terraform v. 0.3

## Setup steps
* Create a project in Hetzner Cloud
* Add all necessary SSH public keys to `Security > SSH Keys`.
* Generate API token for read/write.
* Optionally create variables file from the template below and provide the values for the variables. 
  You can skip this step. Terraform will then prompt for the values on `terraform plan`.
```bash 
cp terraform.tfvars.template terraform.tfvars
```  
* Run:
```bash
terraform init
```

## Templates
The default template is `docker`, which can be found in `templates/user_data_docker.yaml.tpl`.
It contains the installation of docker and docker-compose. 
It can be used for hosting applications in docker containers.
By creating your own template, you can install and configure the VM optimized to your software requirements.
The template file name needs to follow the pattern: `user_data_<template_name>.yaml.tpl` and has to be stored in 
`templates` folder.

## Provision a VM
```bash
terraform plan
terraform apply
```
