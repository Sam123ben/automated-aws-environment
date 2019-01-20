#!/bin/sh

cluster_name=$1
region=$2
bucket_name=$3
availability_zone=$4

stable_kops_version=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)

curl -LO https://github.com/kubernetes/kops/releases/download/$stable_kops_version/kops-linux-amd64
sudo chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
export KOPS_CLUSTER_NAME="$cluster_name.k8s.local" && export KOPS_STATE_STORE=s3://$bucket_name
kops create secret --name $cluster_name.k8s.local sshpublickey admin -i ~/.ssh/authorized_keys
kops create cluster --node-count=1 --node-size=t2.micro --zones=$region --name=$cluster_name.k8s.local

kops create cluster --node-count=2 --node-size=t2.micro --zones=$availability_zone --name=$cluster_name.k8s.local

kops update cluster --name $cluster_name.k8s.local --yes