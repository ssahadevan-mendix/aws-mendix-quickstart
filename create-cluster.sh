
echo "Starting $0: $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_KEY_PAIR "

eksctl create cluster \
--name $CLUSTER_NAME \
--region $AWS_DEFAULT_REGION \
--with-oidc \
--ssh-access \
--ssh-public-key $AWS_KEY_PAIR \
--managed
