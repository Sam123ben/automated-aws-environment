#!/bin/sh

# time \
#     ansible-playbook \
#         -i /tmp/inventory \
#         ansible/create-ec2.yml

echo "Triggering the ansible playbook to create the k8s cluster"

time \
    ansible-playbook \
        -i /tmp/inventory \
        ansible/create-k8s.yml