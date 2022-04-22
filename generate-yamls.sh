#Get the  external IP address ip.nip.io

# Find the load balancer IP address
lbIp=$(kubectl get svc  | grep -i LoadBalancer | awk '{ print $4 }' | nslookup | tail -2 | grep Address | awk '{ print $2 }' )
echo "Ingress Loadbalancer IP is :" $lbIp

#Replace address in configure-template.yaml and write to configure.yaml

sed "s/domain: xxx.yyy/domain:  $lbIp.nip.io/g" configure-template.yaml 2>&1 | tee configure-temp.yaml

# Update Registry information

echo $MENDIX_REGISTRY_PULL_URL $MENDIX_REGISTRY_PUSH_URL $MENDIX_REGISTRY_NAME

sed -e "s/auth_user: <TODO:registry-user>/auth_user: $MENDIX_AUTH_USER/g" -e "s/auth_password: <TODO:registry-pw>/auth_password: $MENDIX_AUTH_PW/g" configure-temp.yaml 2>&1 | tee configure-temp1.yaml
sed  -e "s/auth_pull_url: <TODO:>/auth_pull_url: $MENDIX_REGISTRY_PULL_URL/g" \
     -e "s/auth_push_url: <TODO:>/auth_push_url: $MENDIX_REGISTRY_PUSH_URL/g" \
     -e "s/registry_name: <TODO:>/registry_name: $MENDIX_REGISTRY_NAME/g" \
     configure-temp1.yaml 2>&1 | tee configure.yaml

#Replace mode to standalone  and write to configure.yaml

sed "s/cluster_mode: connected/cluster_mode: standalone/g" configure.yaml 2>&1 | tee configure-standalone.yaml

#Replace address in demo-template.yaml and write to demo.yaml
# Used for application deployment
sed "s/appURL: demo.xxx.yyy/appURL: demo.$lbIp.nip.io/g" demo-template.yaml 2>&1 | tee demo.yaml



