kubectl run --rm -it debug --image amazon/aws-cli --command bash --overrides='{ "spec": { "serviceAccount": "demo-sa" }  }' -n demo-s3
