# Aws Mendix quickstart
 AWS Mendix Private Cloud Quickstart

    Scripted install of EKS Cluster in AWS.
    Install nginx ingress controllers
    Configure Namespace for mendix
    Deploys a mendix application

## Sequence Diagram

![Sequence Diagram](/images/sequence.png)

## Prerequistes:

     aws cli
     eksctl
     kubectl
     Access keys AWS cli
     ssh key pair for eksctl

## Note: This has been tested on an Apple Macintosh only

# Configurations

## env.sh

    Update env.sh


    env.sh:export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"

    env.sh:export AWS_SECRET_ACCESS_KEY="TODO:"

    env.sh:export AWS_DEFAULT_REGION="TODO:"

## Update create-cluster.sh

       eksctl create cluster \
         --name ssekscluster \
         --region us-east-2 \
         --with-oidc \
         --ssh-access \
         --ssh-public-key <TODO:yourkeypair> \
         --managed

## Update configure-template.yaml

    configure-template.yaml:    auth_user: <TODO:registry-user>
    configure-template.yaml:    auth_password: <TODO:registry-pw>

## Install and configure

Default is connected mode

    do-all.sh connected

    do-all.sh standalone


## Screenshots

   https://github.com/ssahadevan-mendix/aws-mendix-quickstart/wiki


## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
