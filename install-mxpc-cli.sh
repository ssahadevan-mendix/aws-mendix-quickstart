

pwd 
rm mxpc-cli*.gz

rm mxpc-cli*.tar

echo "Downloading from " MENDIX_CLI_DOWNLOAD_LINK
wget $MENDIX_CLI_DOWNLOAD_LINK 

ls -lrt


gunzip mxpc-cli*.gz
tar -xvf mxpc-cli*.tar

ls -lrt mxpc-cli

chmod +x mcpc-cli

mxpc-cli

