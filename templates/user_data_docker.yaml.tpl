#cloud-config
users:
  - name: deploy
    groups: users, admin, docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
  %{ for key in ssh_pub_keys ~}
    - "${key}"
  %{ endfor ~}

package_update: true
package_upgrade: true
packages:
  - curl
  - docker.io
  - docker-compose
  - apache2-utils
runcmd:
  - sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
  - systemctl reload sshd
