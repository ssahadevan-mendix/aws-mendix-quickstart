#./mxpc-cli installer -n devns -i cd8e6dbf-3b99-45c4-a19a-decb18e2fc15 -s IGi500iXm75bdPvF

#./mxpc-cli installer -n new -i 9ae2c9e0-0544-4d6b-a221-d8ce25bdfc15 -s UVGmXR8r4454vVW9



defaultMode="connected"
mode=$defaultMode

mode=$(get-mode.sh $1)
echo "Mode is $mode"

if [ $mode=$defaultMode ];
then
  . ./get-address.sh 

  echo "base install "
  mxpc-cli base-install --namespace new  -i $MENDIX_CONFIG_IVAL -s $MENDIX_CONFIG_SVAL --clusterMode connected  --clusterType generic

  echo "apply config"
  mxpc-cli apply-config  -i $MENDIX_CONFIG_IVAL -s $MENDIX_CONFIG_SVAL --file configure.yaml 
else 
  . ./get-address.sh 

  echo "base install "
  mxpc-cli base-install --namespace new  --clusterMode standalone  --clusterType generic

  echo "apply config"
  mxpc-cli apply-config  --file configure-standalone.yaml 
fi


