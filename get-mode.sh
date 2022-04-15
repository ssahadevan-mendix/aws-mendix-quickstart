
mode="connected"

if [ -z $1  ];
then
  echo $mode
elif [ "$1"  = $mode ];
then 
  echo $mode
elif [ "$1"  = "standalone" ];
then
  echo "standalone"
  mode=$1
fi

echo $mode
