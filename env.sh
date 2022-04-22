#Set Path as required
export PATH=$PATH:.
echo $PATH

export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"
export AWS_SECRET_ACCESS_KEY="TODO:"

## Used in create-cluster.sh, del-cluster.sh
export AWS_DEFAULT_REGION="TODO:"
export AWS_KEY_PAIR="TODO:"
export CLUSTER_NAME="ssekscluster"

# Switch to create cluster or Not - Y or N
export CREATE_CLUSTER="Y"

## Used in configure.sh
## only required for connected mode -i and -s parameter
## mxpc-cli base-install --namespace new  -i $MENDIX_CONFIG_IVAL -s $MENDIX_CONFIG_SVAL --clusterMode connected  --clusterType generic
export MENDIX_CONFIG_IVAL="TODO:"
export MENDIX_CONFIG_SVAL="TODO:"

## Registry config - configure-template.yaml is updated with this information
export MENDIX_REGISTRY_PULL_URL="ssmendixrepo.jfrog.io"
export MENDIX_REGISTRY_PUSH_URL="ssmendixrepo.jfrog.io"
export MENDIX_REGISTRY_NAME="default-docker-virtual/mendixapp"
export MENDIX_AUTH_USER="TOD:O"
export MENDIX_AUTH_PW="TODO:"

