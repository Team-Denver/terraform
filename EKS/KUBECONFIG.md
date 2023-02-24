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



