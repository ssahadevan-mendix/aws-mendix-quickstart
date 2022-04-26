

if [[ $INSTALL_POSTGRES_MINIO == "Y" ]];
then

  echo "Installing Postgres and Minio " $INSTALL_POSTGRES_MINIO

  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo update

  kubectl create ns privatecloud-storage

  helm install postgres-shared bitnami/postgresql --namespace=privatecloud-storage \
    --set auth.postgresPassword=$POSTGRES_PW \
    --set image.tag=12 \
    --set persistence.size=1Gi \
    --set global.storageClass=gp2
  helm install minio-shared bitnami/minio --namespace=privatecloud-storage \
    --set auth.rootUser=minioadmin \
    --set auth.rootPassword=$MINIO_PW \
    --set persistence.size=5Gi \
    --set global.storageClass=gp2
else
   echo "Note: Not installing Postgres and Minio"
fi
