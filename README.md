# aws-mendix-quickstart
 AWS Mendix Private Cloud Quickstart

 Get an EKS Cluster stood up in AWS.
 Install ingress controllers

# Prerequistes:

aws cli
eksctl
kubectl

# Create EKS Cluster:

 . ./create-cluster.sh  

# Install Ingress Controller:

. ./install-aws-ngnix-controller.sh

# Configure Cluster for mendix
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
