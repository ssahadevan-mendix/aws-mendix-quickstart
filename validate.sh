
expectedResult=15

kubectl describe mendixapp --all-namespaces

kubectl get pods --all-namespaces | grep Running 

podsRunning=$(kubectl get pods --all-namespaces | grep Running | wc -l)
#echo $podsRunning

if [[ $podsRunning -ge $expectedResult ]];
then 
  echo "Result: Count of pods running "
  echo "$0 - Success: Number of running pods is " $podsRunning 
  echo ""
else
  echo "Result:*** "
  echo "*** $0 - Error: Number of running pods is " $podsRunning  ", expected Result is " $expectedResult
  echo "*** "
fi

demoPodsExpected=1
demoPodsRunning=$(kubectl get pods --all-namespaces | grep -i demo-master |  grep Running | wc -l)
if [[ $demoPodsRunning -eq $demoPodsExpected ]];
then 
  echo "Result: Checking Application Pods "
  echo "$0 - Success: Number of running demo application pods is " $demoPodsRunning 
  echo ""
  appUrl=$(fgrep -i appUrl demo.yaml | cut -f2 -d':' )
  echo "$0   Application Url:"$appUrl
  # kubectl get svc -n grafana | grep -i LoadBalancer
  prometheusAddress=$(kubectl get svc -n grafana  | grep -i LoadBalancer | awk '{ print $4 }' )
  prometheusPort=$(kubectl get svc -n grafana| grep -i LoadBalancer | awk '{ print $5 }' | cut -f1 -d':')
  echo "$0   Prometheus Url: " $prometheusAddress":"$prometheusPort
  echo ""
else
  echo "Result:*** "
  echo "*** $0 - Error: Number of running demo application pods is " $demoPodsRunning  ", expected Result is " $demoPodsExpected
  echo "*** "
fi

