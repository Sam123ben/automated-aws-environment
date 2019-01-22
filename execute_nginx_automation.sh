#!/bin/sh

time \
    ansible-playbook \
        -i /tmp/inventory \
        ansible/create-ec2.yml

echo "Triggering the ansible playbook which will create a nginx docker container on the enwly created ec2 instance"

time \
    ansible-playbook \
        -i /tmp/inventory \
        ansible/create-nginx.yml