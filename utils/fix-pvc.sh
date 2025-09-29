# If you run into an issue with the loki stack in pending status, it may be because it is waiting on add-ons.
# this will help resolve that issue.

clusterName="mxdemo"
eksctl create iamserviceaccount \
        --name ebs-csi-controller-sa \
        --namespace kube-system \
        --cluster ${clusterName}  \
        --role-name AmazonEKS_EBS_CSI_DriverRole \
        --role-only \
        --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
        --approve


eksctl create addon --name aws-ebs-csi-driver --cluster mxdemo
