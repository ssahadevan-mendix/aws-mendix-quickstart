# Aws Mendix quickstart
 AWS Mendix Private Cloud Quickstart

    Scripted install of EKS Cluster in AWS.
    Install nginx ingress controllers
    Configure Namespace for mendix
    Deploys a mendix application


## Acknowledgements

   Thanks to Pablo Diaz, Dmitrii Zolotukhin for reviewing and providing feedback.
   Thanks to Clyde Waal , Gautam Gautam who provided the ideas and inspiration as part of the Cloud Practice discussions.

## Sequence Diagram

![Sequence Diagram](/images/sequence.png)

## Prerequistes:

     aws cli
     eksctl
     kubectl
     Access keys for AWS cli
     ssh key pair for eksctl
     mxpc-cli - It is packaged here. Download and install the appropriate version from the Mendix platform
     Docker compatible registry ( to push/pul any images )

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

    # Switch for Minio and Postgres install - Y or N
    export INSTALL_POSTGRES_MINIO="Y"
    #Passwords for Postgres and Minio
    export MINIO_PW="TODO:"
    export POSTGRES_PW="TODO:"

    # Configure LInk to download Mendix Private Cloud CLI
    export MENDIX_CLI_DOWNLOAD_LINK="https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-2.4.1-linux-amd64.tar.gz"


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

    Events:           <none>
    default                ingress-ngnix-nginx-ingress-58d84f694d-8lj2f   1/1     Running   0          76m
    grafana                loki-0                                         1/1     Running   0          66m
    grafana                loki-grafana-bff99f7f6-447vh                   2/2     Running   0          66m
    grafana                loki-kube-state-metrics-799f7cbf89-sl9zr       1/1     Running   0          66m
    grafana                loki-prometheus-server-54b7bc4574-vd9rd        2/2     Running   0          66m
    grafana                loki-promtail-4tcff                            1/1     Running   0          66m
    grafana                loki-promtail-87ckc                            1/1     Running   0          66m
    kube-system            aws-node-fnzvv                                 1/1     Running   0          79m
    kube-system            aws-node-n54vd                                 1/1     Running   0          79m
    kube-system            coredns-56b458df85-54mbk                       1/1     Running   0          91m
    kube-system            coredns-56b458df85-q5bmj                       1/1     Running   0          91m
    kube-system            kube-proxy-kzs5m                               1/1     Running   0          79m
    kube-system            kube-proxy-vsxm2                               1/1     Running   0          79m
    new                    demo-master-ff9b8d85f-vpwr9                    2/2     Running   0          64m
    new                    mendix-agent-64cc6b9c67-7kz9p                  1/1     Running   0          65m
    new                    mendix-operator-cc6dfcfd5-jj4xl                1/1     Running   0          65m
    privatecloud-storage   minio-shared-5c799fdd4b-lw6sn                  1/1     Running   0          66m
    privatecloud-storage   postgres-shared-postgresql-0                   1/1     Running   0          66m
    Result: Count of pods running
    validate.sh - Success: Number of running pods is  18

    Result: Checking Application Pods
    validate.sh - Success: Number of running demo application pods is  1

    validate.sh   Application Url: demo.3.12.43.139.nip.io # URL to access the app
    validate.sh   Prometheus Url:  a7e82c3f4d494411f846668234609d83-283292745.us-east-2.elb.amazonaws.com:9090

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


## Deleting the cluster

   del-cluster.sh will delete the cluster

## Screenshots

   https://github.com/ssahadevan-mendix/aws-mendix-quickstart/wiki


## References
Install the Mendix components on the cluster using the instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-cli-non-interactive
