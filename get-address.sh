#Get the  external IP address ip.nip.io

# Find the load balancer IP address
lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
echo "Ingress Loadbalancer IP is :" $lbIp

#Replace address in configure-template.yaml and write to configure.yaml

sed "s/domain: xxx.yyy/domain:  $lbIp.nip.io/g" configure-template.yaml 2>&1 | tee configure.yaml

#Replace mode to standalone  and write to configure.yaml

sed "s/cluster_mode: connected/cluster_mode: standalone/g" configure.yaml 2>&1 | tee configure-standalone.yaml

#Replace address in demo-template.yaml and write to demo.yaml
# Used for application deployment
sed "s/appURL: demo.xxx.yyy/appURL: demo.$lbIp.nip.io/g" demo-template.yaml 2>&1 | tee demo.yaml



