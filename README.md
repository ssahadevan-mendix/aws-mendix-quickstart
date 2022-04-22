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

    export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"
    export AWS_SECRET_ACCESS_KEY="TODO:"

    ## Used in create-cluster.sh, del-cluster.sh
    export AWS_DEFAULT_REGION="TODO:"
    export AWS_KEY_PAIR="TODO:"
    export CLUSTER_NAME="mxdemo"

    # Switch to create cluster or Not - Y or N
    export CREATE_CLUSTER="Y"

    ## Used in configure.sh
    ## only required for connected mode -i and -s parameter
    ## mxpc-cli base-install --namespace new  -i $MENDIX_CONFIG_IVAL -s $MENDIX_CONFIG_SVAL --clusterMode connected  --clusterType generic
    export MENDIX_CONFIG_IVAL="TODO:"
    export MENDIX_CONFIG_SVAL="TODO:"

    ## Registry config - configure-template.yaml is updated with this information
    export MENDIX_REGISTRY_PULL_URL="TODO:"
    export MENDIX_REGISTRY_PUSH_URL="TODO:"
    # Note: need to escape / with \/ for sed replacements
    export MENDIX_REGISTRY_NAME="default-docker-virtual\/mendixapp"
    export MENDIX_AUTH_USER="TODO:"
    export MENDIX_AUTH_PW="TODO:"

## Ensure that you can run mxpc-cli
   Your Mac's security sesttings may prevent the downloaded mxpc-cli from executing.

   . ./mxpc-cli -help

## Create Cluster, Configure and Deploy Mendix application

Default is connected mode

    . ./do-all.sh connected
          or
    . ./do-all.sh standalone


## Validation

    Added validate.sh that is called at the end of do-all.sh
    It will show if the result was Successful or not.

    validate.sh - Success: Number of running pods is  16

    Result:
    validate.sh - Success: Number of running demo application pods is  1


## Mendix application
  Mendix application will be available at apurl seen in the generated demo.yaml

  Example:
  appURL: demo.18.118.31.87.nip.io        

## Prometheus
   Available at the external ip address of the prometheus svc port 9090

   kubectl get svc -n grafana | grep -i Loadbalancer

   Example:
   http://ab5b2c0d274690ae9d506d21ed876-1145176934.us-east-2.elb.amazonaws.com:9090/


## Generated files

  generate-yamls.sh creates
      configure.yaml
      configure-standalone.yaml
      demo.yaml

## Screenshots

   https://github.com/ssahadevan-mendix/aws-mendix-quickstart/wiki


## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
