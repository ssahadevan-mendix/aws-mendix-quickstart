
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
. ./configure.sh $1
