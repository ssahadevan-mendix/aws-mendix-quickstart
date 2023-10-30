#
#
#
## Unistall some components
helm uninstall postgres-shared -n privatecloud-storage
helm uninstall minio-shared -n privatecloud-storage
helm uninstall loki -n grafana
