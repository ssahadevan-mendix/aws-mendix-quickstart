
expectedResult=15

kubectl describe mendixapp --all-namespaces

kubectl get pods --all-namespaces | grep Running 

podsRunning=$(kubectl get pods --all-namespaces | grep Running | wc -l)
#echo $podsRunning

if [[ $podsRunning -ge $expectedResult ]];
then 
  echo "Result: "
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
  echo "Result: "
  echo "$0 - Success: Number of running demo application pods is " $demoPodsRunning 
  echo ""
else
  echo "Result:*** "
  echo "*** $0 - Error: Number of running demo application pods is " $demoPodsRunning  ", expected Result is " $demoPodsExpected
  echo "*** "
fi

