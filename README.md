# Aws Mendix quickstart
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

## Screenshots

   https://github.com/ssahadevan-mendix/aws-mendix-quickstart/wiki

## Sequence Diagram

https://lucid.app/lucidchart/f42df2f1-fb51-4920-8769-d34b6ffef51a/view?page=0_0&invitationId=inv_3a22092d-28c6-42f3-9770-38ce3fb848a1#

## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
