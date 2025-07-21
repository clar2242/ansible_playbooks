#!/bin/bash

# sign in to onepassword (stops multiple prompts to auth)
op signin
op whoami

# disable screensave
defaults -currentHost write com.apple.screensaver idleTime 0

source ./.venv/bin/activate

ansible-playbook -e@credentials playbooks/update.yml
ansible-playbook -e@credentials playbooks/docker.yml

# enable screensaver
defaults -currentHost write com.apple.screensaver idleTime 300
