#
# Usage:
# do-all.sh connected
# do-all.sh standalone
#
#

mode=get-mode.sh

### Create a cluster 
. ./create-cluster.sh

### Install nginx
. ./install-nginx-ingress.sh
sleep 20

### Install Prometheus
install-grafana-prometheus.sh

sleep 40


echo "$0: First parameter  is : " $1

### Configure namespace for Mendix runtime
. ./configure.sh mode


### Deploy the application
kubectl apply -f demo.yaml
