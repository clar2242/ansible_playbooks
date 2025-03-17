#!/bin/bash

op signin
op whoami

ansible-playbook -e@credentials playbooks/update.yml
ansible-playbook -e@credentials playbooks/docker.yml
