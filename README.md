# aws-mendix-quickstart
 AWS Mendix Private Cloud Quickstart

 Get an EKS Cluster stood up in AWS.
 Install ingress controllers
 Configure Namespace

# Prerequistes:

aws cli
eksctl
kubectl


# Do complete install
Create a cluster
Install Nginx
Install Prometheus
Configure namespace

do-all.sh


## Install application

Install the Portfolio manager application in Standalone mode

kubectl apply -f demo.yaml

# Create EKS Cluster:

 . ./create-cluster.sh  

# Install Ingress Controller:

. ./install-aws-ngnix-controller.sh

# Configure Cluster for mendix
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
