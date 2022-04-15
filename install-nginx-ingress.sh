helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

#helm install my-release nginx-stable/nginx-ingress
helm install ingress-ngnix nginx-stable/nginx-ingress


#helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#helm repo update

#helm install ingress-nginx ingress-nginx/ingress-nginx


