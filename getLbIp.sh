# Find the load balancer IP address
lbip=""
while [[ ${#lbIp} -le 5 ]]
do
  lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
  echo "Ingress Loadbalancer IP is :" $lbIp
  echo ${#lbIp}
done
export lbIp=$lbIp
