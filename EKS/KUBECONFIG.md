## KubeConfig Setup
---
1. Check the latest version of AWS CLI
```sh
aws --version
```
2. Verify your identity
```sh
aws sts get-caller-identity
```

3. Set a new KubeConfig file for your cluster at **"~/.kube/config"** for linux based system
```sh
aws eks --region example_region update-kubeconfig --name cluster_name
```


4. If you want to manually keep Kubeconfig file somewhere else 
```sh
kubectl get pods --kubeconfig <location, eg: ./.kube/config>
```

5. To verify the connection run
```sh
kubectl get svc
```

aws eks --region us-east-1 update-kubeconfig --name poc-adot-with-eks   

oidc_id=$(aws eks describe-cluster --name poc-adot-with-eks --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)

aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4

   
aws eks describe-cluster \
  --name poc-adot-with-eks \
  --query "cluster.identity.oidc.issuer" \
  --output text

https://oidc.eks.us-east-1.amazonaws.com/id/


kubectl annotate serviceaccount ebs-csi-controller-sa \
    -n kube-system \
    eks.amazonaws.com/role-arn=arn:aws:iam::475600362560:role/AmazonEKS_EBS_CSI_DriverRole


