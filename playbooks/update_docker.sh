#!/bin/bash

# Generate docker.yml to include all docker playbooks

echo "---" > docker.yml

ls docker/*.yml | while read playbook
do

echo "- import_playbook: $playbook" >> docker.yml

done

echo "- import_playbook: docker_prune.yml" >> docker.yml
