export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

export AWS_VPC_ID=$(aws eks describe-cluster \
  --name $CLUSTER_NAME \
  --region $AWS_DEFAULT_REGION \
  --query 'cluster.resourcesVpcConfig.vpcId' \
  --output text)


echo $AWS_VPC_ID $CLUSTER_NAME $AWS_DEFAULT_REGION $AWS_ACCOUNT_ID


eksctl utils associate-iam-oidc-provider \
  --cluster $CLUSTER_NAME \
  --region $AWS_DEFAULT_REGION \
  --approve

curl -S https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json -o iam-policy.json 

export ALB_LBC_IAM_POLICY_ARN=$(aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy-ALBDEMO \
  --policy-document file://iam-policy.json \
  --query 'Policy.Arn' \
  --output text)


eksctl create iamserviceaccount \
  --cluster=$CLUSTER_NAME \
  --region $AWS_DEFAULT_REGION \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --override-existing-serviceaccounts \
  --attach-policy-arn=arn:aws:iam::${AWS_ACCOUNT_ID}:policy/AWSLoadBalancerControllerIAMPolicy-ALBDEMO \
  --approve


helm repo add eks https://aws.github.io/eks-charts && helm repo update
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
helm install aws-load-balancer-controller \
  eks/aws-load-balancer-controller \
  --namespace kube-system \
  --set clusterName=$CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set vpcId=$AWS_VPC_ID \
  --set region=$AWS_DEFAULT_REGION
