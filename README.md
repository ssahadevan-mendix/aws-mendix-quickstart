# aws-mendix-quickstart
 AWS Mendix Private Cloud Quickstart

 EKS Cluster stood up in AWS.
 Install ingress controllers
 Configure Namespace

# Prerequistes:

   aws cli
   eksctl
   kubectl

# Note: THis has been tested on an Apple Macintosh

# Configurations

## env.sh

    Update env.sh


    env.sh:export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"

    env.sh:export AWS_SECRET_ACCESS_KEY="TODO:"

    env.sh:export AWS_DEFAULT_REGION="TODO:"

## Update configure-template.yaml

    configure-template.yaml:    auth_user: <TODO:registry-user>
    configure-template.yaml:    auth_password: <TODO:registry-pw>


# Do complete install

Default is connected mode

    do-all.sh

    do-all.sh standalone


## Install application

Install the Portfolio manager application in Standalone mode

kubectl apply -f demo.yaml


# Configure Cluster for mendix
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
