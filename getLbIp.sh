# Find the load balancer IP address
lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
echo "Ingress Loadbalancer IP is :" $lbIp
export lbIp=$lbIp
