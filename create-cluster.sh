
STARTCRCL=$(date +%s)
echo "Starting $0: $CREATE_CLUSTER $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_KEY_PAIR "

if [[ $CREATE_CLUSTER == "Y" ]];
then
  echo "$0: $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_KEY_PAIR "
  if [[ $USE_SPOT_INSTANCES == "Y" ]];
  then
    echo "Using Spot instances " $USE_SPOT_INSTANCES
    eksctl create cluster \
      --name $CLUSTER_NAME \
      --spot \
      --region $AWS_DEFAULT_REGION \
      --with-oidc \
      --ssh-access \
      --ssh-public-key $AWS_KEY_PAIR \
      --managed
  else
    echo "Not using Spot instances " $USE_SPOT_INSTANCES
    eksctl create cluster \
      --name $CLUSTER_NAME \
      --region $AWS_DEFAULT_REGION \
      --with-oidc \
      --ssh-access \
      --ssh-public-key $AWS_KEY_PAIR \
      --managed
  fi
else
  echo "Not creating cluster because CREATE_CLUSTER is set to " $CREATE_CLUSTER
fi

ENDCRCL=$(date +%s)

DIFF=$(( $ENDCRCL - $STARTCRCL ))
echo "$0 took $DIFF seconds "
