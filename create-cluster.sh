
echo "Starting $0: $CREATE_CLUSTER $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_KEY_PAIR "

if [[ $CREATE_CLUSTER == "Y" ]];
then
  echo "$0: $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_KEY_PAIR "
  eksctl create cluster \
    --name $CLUSTER_NAME \
    --region $AWS_DEFAULT_REGION \
    --with-oidc \
    --ssh-access \
    --ssh-public-key $AWS_KEY_PAIR \
    --managed
else
  echo "Not creating cluster because CREATE_CLUSTER is set to " $CREATE_CLUSTER
fi
