#!/bin/bash
add-apt-repository -y ppa:rquillo/ansible
apt-get update && apt-get -y install ansible cowsay

ansible-playbook playbook.yml -c local -l local -i hosts
