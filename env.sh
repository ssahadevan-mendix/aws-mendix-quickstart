#Set Path as required
export PATH=$PATH:.
echo $PATH

export AWS_ACCESS_KEY_ID="TODO:your-aws-access-key"
export AWS_SECRET_ACCESS_KEY="TODO:"

# Used in create-cluster.sh, del-cluster.sh
export AWS_DEFAULT_REGION="TODO:"
export AWS_KEY_PAIR="TODO:"
export CLUSTER_NAME="ssekscluster"

# Used in configure.sh
export MENDIX_CONFIG_IVAL="TODO:"
export MENDIX_CONFIG_SVAL="TODO:"


# Dec 9 , 2021 Added for Load Balancer Config
export LBC_VERSION="v2.3.0"
