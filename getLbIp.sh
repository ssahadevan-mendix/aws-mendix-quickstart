# Find the load balancer IP address
lbip=""
while [[ ${#lbIp} -le 5 ]]
do
  echo "$0: Checking if Loadbancer IP is assigned ... "
  lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
  echo "$0: Ingress Loadbalancer IP is :" $lbIp, "lbIp length is : " ${#lbIp}
  sleep 10
done
export lbIp=$lbIp
