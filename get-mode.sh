
mode="connected"

if [ -z $1  ];
then
  mode="connected"
elif [ "$1"  = "standalone" ];
then
  mode=$1
fi

echo $mode
