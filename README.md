# automnated-aws-environment
This repo holds the ansible playbooks and resources for creating an environment on aws from scratch with minimal aws resources

#### Steps to create the nginx application or provision the k8s cluster ####
    Requirements before triggering the scripts to automate (Expecting the users are using Mac books and not or never been tested on Microsoft OS):
        1. Install the aws cli (Configure the aws credentials and ensure the credentials ar in your home dir .aws, Eg: ~/.aws/credentials)
        2. Install boto3 via pip or via any oher means
        3. Install ansible via pip or via any oher means
        4. Optional to install brew (/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

    shell script:

        1. sh ./bootstrap.sh (If the above pre reuired softwares are not installed then please run the bootstrap script to run those for you to install the same)

        2. sh ./execute_nginx_automation.sh (This script will help you to automate the ec2 instance creation and the nginx docker container getting created)

        Once the ec2 instance is created you can login to the ec2 instance via below command:
        "ssh -i /tmp/ec2_keypair.pem ec2-user@<<ec2-host-address>>"

        3. sh ./execute_k8s_automation.sh (This is an optional step, and this script will help you to automate the ec2 instance creation and the new fresh k8s cluster with nginx application along with a sample hello app running via kubernetes)

        Once the ec2 instance is created you can login to the ec2 instance via below command:
        "ssh -i /tmp/ec2_keypair.pem ec2-user@<<ec2-host-address>>"

Once the kubernetes cluster is created, the user can ssh into the newly created ec2-instance and the do his testing of his own local k8s cluster ready to be played on using kops.

####
[root@ip-10-10-0-19 ~]# kubectl get ns
NAME          STATUS   AGE
default       Active   20s
kube-public   Active   16s
kube-system   Active   20s

[root@ip-10-10-0-19 ~]# kubectl get nodes
NAME                                               STATUS   ROLES    AGE   VERSION
ip-172-20-40-224.ap-southeast-2.compute.internal   Ready    node     24s   v1.11.6
ip-172-20-61-214.ap-southeast-2.compute.internal   Ready    master   1m    v1.11.6

