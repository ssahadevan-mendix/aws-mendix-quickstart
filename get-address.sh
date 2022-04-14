#Gives the ip.nip.io

lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
echo "Ingress Loadbalancer IP is :" $lbIp

#Replace address in configure-template.yaml and write to configure.yaml
sed "s/domain: xxx.yyy/domain:  $lbIp.nip.io/g" configure-template.yaml 2>&1 | tee configure.yaml

#Replace mode to standalone  and write to configure.yaml
sed "s/cluster_mode: connected/cluster_mode: standalone/g" configure.yaml 2>&1 | tee configure-standalone.yaml


