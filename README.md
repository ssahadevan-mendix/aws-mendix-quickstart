# aws-mendix-quickstart
 AWS Mendix Private Cloud Quickstart

    Scripted install of EKS Cluster in AWS.
    Install nginx ingress controllers
    Configure Namespace for mendix

## Prerequistes:

     aws cli
     eksctl
     kubectl

## Note: This has been tested on an Apple Macintosh only

# Configurations

## env.sh

    Update env.sh


    env.sh:export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"

    env.sh:export AWS_SECRET_ACCESS_KEY="TODO:"

    env.sh:export AWS_DEFAULT_REGION="TODO:"

## Update configure-template.yaml

    configure-template.yaml:    auth_user: <TODO:registry-user>
    configure-template.yaml:    auth_password: <TODO:registry-pw>


## Install and configure

Default is connected mode

    do-all.sh

    do-all.sh standalone


## Install Mendix application

Install the Portfolio manager application in mode chosen above

    kubectl apply -f demo.yaml


## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
