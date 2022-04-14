# aws-mendix-quickstart
 AWS Mendix Private Cloud Quickstart

 Get an EKS Cluster stood up in AWS.
 Install ingress controllers
 Configure Namespace

# Prerequistes:

aws cli
eksctl
kubectl

# Configurations

    Update env.sh


# Do complete install
Create an EKS cluster
Install Nginx
Install Prometheus
Configure namespace

Default is connected mode

    do-all.sh

    do-all.sh standalone


## Install application

Install the Portfolio manager application in Standalone mode

kubectl apply -f demo.yaml


# Configure Cluster for mendix
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
