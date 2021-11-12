#instructions here - https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/index.md#aws

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/aws/deploy.yaml

# get the Lb extrnal address
kubectl get service --all-namespaces -o yaml | grep -i hostname | cut -f2 -d':'
