#Get the  external IP address ip.nip.io

# Find the load balancer IP address
source getLbIp.sh
echo "Ingress Loadbalancer IP is :" $lbIp

#Replace address in configure-template.yaml and write to configure.yaml

sed "s/domain: <TODO:REPLACE-ME>/domain:  $lbIp.nip.io/g" configure-template.yaml 2>&1 | tee configure-temp.yaml

# Update Registry information

echo $MENDIX_REGISTRY_PULL_URL $MENDIX_REGISTRY_PUSH_URL $MENDIX_REGISTRY_NAME

sed -e "s/auth_user: <TODO:registry-user>/auth_user: $MENDIX_AUTH_USER/g" -e "s/auth_password: <TODO:registry-pw>/auth_password: $MENDIX_AUTH_PW/g" configure-temp.yaml 2>&1 | tee configure-temp-1.yaml

# Update the minio and Postgres passwords from the environment variables
sed -e "s/password: <TODO:POSTGRES_PW>/password: $POSTGRES_PW/g" -e "s/secretkey: <TODO:MINIO_SECRET>/secretkey: $MINIO_PW/g" configure-temp-1.yaml 2>&1 | tee configure-temp-2.yaml

sed  -e "s/auth_pull_url: <TODO:>/auth_pull_url: $MENDIX_REGISTRY_PULL_URL/g" \
     -e "s/auth_push_url: <TODO:>/auth_push_url: $MENDIX_REGISTRY_PUSH_URL/g" \
     -e "s/registry_name: <TODO:>/registry_name: $MENDIX_REGISTRY_NAME/g" \
     configure-temp-2.yaml 2>&1 | tee configure.yaml

#Replace mode to standalone  and write to configure.yaml

sed "s/cluster_mode: connected/cluster_mode: standalone/g" configure.yaml 2>&1 | tee configure-standalone.yaml

#Replace address in demo-template.yaml and write to demo.yaml
# Used for application deployment
sed -e "s/appURL: <TODO:REPLACE-ME>/appURL: demo.$lbIp.nip.io/g" -e "s/sourceURL: <TODO:REPLACE-ME>/sourceURL: $MENDIX_DEMO_MDA/g" demo-template.yaml 2>&1 | tee demo.yaml



