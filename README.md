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
     Access keys for AWS cli
     ssh key pair for eksctl
     mxpc-cli - It is packaged here. Download and install the appropriate version from the Mendix platform

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

## config.sh - Update -i and -s for connected mode

       Update the -i and -s values to reflect your settings

       echo "base install "
       mxpc-cli base-install --namespace new  -i 9ae2c9e0-0544-4d6b-a221-d8ce25bdfc15 -s UVGmXR8r4454vVW9  --clusterMode connected  --clusterType generic

       echo "apply config"
       mxpc-cli apply-config  -i 9ae2c9e0-0544-4d6b-a221-d8ce25bdfc15 -s UVGmXR8r4454vVW9 --file configure.yaml

## Install and configure

Default is connected mode

    do-all.sh connected
          or 
    do-all.sh standalone


## Validation

    kubectl get pods -n new

    should show running pods ( connected mode )

    demo-master-7fd5487c8-hd98k       2/2     Running   0         
    mendix-agent-64cc6b9c67-dbcgs     1/1     Running   0          
    mendix-operator-cc6dfcfd5-l4bl8   1/1     Running   0  

## Mendix application
  Mendix application will be available at apurl seen in the generated demo.yaml

  Example:
  appURL: demo.18.118.31.87.nip.io        

## Prometheus
   Available at the external ip address of the prometheus svc port 9090

   kubectl get svc -n grafana | grep -i Loadbalancer

   Example:
   http://ab5b2c0d274690ae9d506d21ed876-1145176934.us-east-2.elb.amazonaws.com:9090/

## Screenshots

   https://github.com/ssahadevan-mendix/aws-mendix-quickstart/wiki


## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
