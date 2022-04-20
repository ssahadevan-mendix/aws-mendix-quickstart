
expectedResult=15

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
