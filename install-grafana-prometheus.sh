# Instructions here - https://docs.mendix.com/developerportal/deploy/private-cloud-monitor

kubectl create ns grafana

NAMESPACE=grafana
#grafanaDomain=grafana.52.226.246.38.nip.io
grafanaDomain=grafana.3.130.181.104.nip.io

kubectl --namespace $NAMESPACE  create secret generic grafana-admin --from-literal=admin-user=admin --from-literal=admin-password=adminpw


helm upgrade --install loki grafana/loki-stack --version='^2.5.1' --namespace=${NAMESPACE} --set grafana.enabled=true,grafana.persistence.enabled=true,grafana.persistence.size=1Gi,grafana.initChownData.enabled=false,grafana.admin.existingSecret=grafana-admin \
--set prometheus.enabled=true,prometheus.server.persistentVolume.enabled=true,prometheus.server.persistentVolume.size=50Gi,prometheus.server.retention=7d \
--set loki.persistence.enabled=true,loki.persistence.size=10Gi,loki.config.chunk_store_config.max_look_back_period=168h,loki.config.table_manager.retention_deletes_enabled=true,loki.config.table_manager.retention_period=168h \
--set promtail.enabled=true,promtail.securityContext.privileged=true \
--set prometheus.nodeExporter.enabled=false,prometheus.alertmanager.enabled=false,prometheus.pushgateway.enabled=false


kubectl --namespace=$NAMESPACE create ingress loki-grafana \
--rule="$grafanaDomain/*=loki-grafana:80,tls" \
--default-backend="loki-grafana:80"

#Expose Prometheus
kubectl apply -f expose-prometheus.yaml
