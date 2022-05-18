#Set Path as required
export PATH=$PATH:.
echo $PATH

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

# Location of the MDA file. This will be used to generate the demo.yaml by generate-yaml.sh
export MENDIX_DEMO_MDA="https:\/\/demo-storage-d1eyl9oe4fo8ph151641-staging.s3.us-east-2.amazonaws.com\/public\/Main+line-0.0.0.6.mda"

# Configure LInk to download Mendix Private Cloud CLI
export MENDIX_CLI_DOWNLOAD_LINK="https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-2.4.1-linux-amd64.tar.gz"

# Mendix namespace
export MENDIX_NAMESPACE=new
