# Get alb and delete it if it exists
aws elbv2 describe-load-balancers
listOfAlbs=$(aws elbv2 describe-load-balancers | grep arn | grep k8s-mendix | sed -E 's/\"LoadBalancerArn\"\://'  | cut -f1 -d ',' | xargs echo -n )


echo $listOfAlbs

for alb in $listOfAlbs
do
 echo "Deleting alb" $alb
 aws elbv2 delete-load-balancer --load-balancer-arn=$alb
done

aws elbv2 describe-load-balancers
