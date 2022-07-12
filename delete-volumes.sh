aws ec2 describe-volumes 2>&1 | tee volumes.txt
listOfVolumes=$(fgrep -i volumeId volumes.txt | cut -f2 -d':' | uniq | cut -f1 -d',' |  tr -d '"')

echo $listOfVolumes

for volume in $listOfVolumes
do
 echo "Deleting volume" $volume
 aws ec2 delete-volume --volume-id=$volume
done

