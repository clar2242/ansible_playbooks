#!/bin/bash

ansible-playbook -e@credentials playbooks/update.yml
ansible-playbook -e@credentials playbooks/docker.yml
