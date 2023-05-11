

pwd 
rm mxpc-cli*.gz

rm mxpc-cli*.tar

echo https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-$mendixOperatorVersion-$os.tar.gz
wget https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-$mendixOperatorVersion-$os.tar.gz
tar xvf mxpc-cli-$mendixOperatorVersion-$os.tar.gz

rm mxpc-cli-$mendixOperatorVersion-$os.tar.gz*


ls -lrt


gunzip mxpc-cli*.gz
tar -xvf mxpc-cli*.tar

ls -lrt mxpc-cli

chmod +x mcpc-cli

mxpc-cli

