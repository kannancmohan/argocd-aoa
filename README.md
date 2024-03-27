### Install
```
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --namespace argocd --create-namespace --dependency-update --set argo-cd.configs.secret.argocdServerAdminPassword=$ARGOCD_ADMIN_PWD
helm upgrade argocd ./bootstrap/argo/ --namespace argocd  --dependency-update -f ./bootstrap/argo/values.yaml --set argo-cd.configs.secret.argocdServerAdminPassword=$ARGOCD_ADMIN_PWD
```

### Helm diff 
```
helm diff  upgrade argocd ./bootstrap/argo/ -n argocd  -f ./bootstrap/argo/values.yaml --set argo-cd.configs.secret.argocdServerAdminPassword=$ARGOCD_ADMIN_PWD
```

### traefik dashboard
```
kubectl --namespace kube-system port-forward deployments/traefik 9000:9000
```
### argocd 
```
kubectl -n argocd port-forward svc/argocd-server 8080:443
```
