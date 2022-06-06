kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.26.0/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.15.0/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.15.0/interceptors.yaml


kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml

kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
