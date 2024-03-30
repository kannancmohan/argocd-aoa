## Self signed certificate 
### generate rsa private key  
```
openssl genrsa -out ca.key 4096
```
### generate a public CA certificate 
```
# interactive
openssl req -new -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365

# non-interactive and 10 years expiration
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
```
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

## Certificate verification 
### verifying certificate  of a host 
```
curl https://argocd.dev.local -kv
```
in the output check the 'Server certificate:' section

### OR
```
curl --cacert <(kubectl -n cert-manager get secret self-signed-tls-cert -o jsonpath='{.data.ca\.crt}' | base64 -d) https://argocd.dev.local
```

###
```
openssl verify -CAfile \
<(kubectl -n cert-manager get secret self-signed-tls-cert -o jsonpath='{.data.ca\.crt}' | base64 -d) \
<(kubectl -n argocd get secret argocd-tls-cert -o jsonpath='{.data.tls\.crt}' | base64 -d)
```
