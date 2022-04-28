#
# Usage:
# do-all.sh connected
# do-all.sh standalone
#
#

#Sets the Environment variables
. ./env.sh
chmod +x *.sh

mode=get-mode.sh

### Create a cluster 
create-cluster.sh

### Install nginx
install-nginx-ingress.sh
sleep 20

### Install Postgres and Minio
install-postgres-minio.sh

### Install Prometheus
install-grafana-prometheus.sh


echo "$0: First parameter  is : " $1

### Configure namespace for Mendix runtime
configure.sh mode


sleep 40

### Deploy the application
kubectl apply -f demo.yaml

sleep 120

validate.sh

