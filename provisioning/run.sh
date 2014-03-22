#!/bin/bash
apt-add-repository ppa:rquillo/ansible
apt-get update && apt-get -y install ansible

ansible-playbook -i /provisioning/hosts -l local -c local /provisioning/playbook.yml
