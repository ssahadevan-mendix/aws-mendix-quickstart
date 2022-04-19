eksctl create cluster \
--name ssekscluster \
--region us-east-2 \
--with-oidc \
--ssh-access \
--ssh-public-key <TODO:yourkeypair> \
--managed
