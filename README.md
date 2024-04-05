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

### Monitoring
Prometheus, Grafana, and Node Exporters are commonly used to monitor system-level application insights. These tools specifically provide node and container statistics, which allow developers to analyse real-time metrics of containers and nodes

#### Monitoring Tools
<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Installation</th>
    </tr>
    <tr>
        <td><a href="https://prometheus.io/">Prometheus</a></td>
        <td>Monitoring & alerting solution that collects metrics data and stores that data in a time series database</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/">Grafana</a></td>
        <td>Allows to query, visualize, alert on, and explore metrics, logs, and traces no matter where it's stored.</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
    <tr>
        <td><a href="https://github.com/prometheus/node_exporter">Prometheus Node Exporter</a></td>
        <td>Agent that gathers system(Hardware and OS) level metrics and exposes them in a format which can be ingested by Prometheus.</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
    <tr>
        <td><a href="https://github.com/kubernetes/kube-state-metrics">kube-state-metrics</a></td>
        <td>Add-on that generates metrics about state of Kubernetes cluster objects. It listens to the Kubernetes API server and gathers information about resources and objects, such as Deployments, Pods, Services, and StatefulSets</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
    <tr>
        <td><a href="https://prometheus.io/docs/alerting/latest/alertmanager/">Prometheus Alertmanager</a></td>
        <td>The Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integrations such as email etc</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
</table>


<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="2">Monitoring</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><a href="https://prometheus.io/">Prometheus</a></td>
        <td>Monitoring & alerting solution that collects metrics data and stores that data in a time series database</td>
    </tr>
    <tr>
        <td><a href="https://thanos.io/">Thanos</a></td>
        <td>Thanos provides a highly available Prometheus setup with extended storage capabilities - Its an extension built for Prometheus.</td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/docs/loki/latest/get-started/overview/">Loki</a></td>
        <td>The server responsible for storing logs and processing queries</td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/docs/loki/latest/send-data/promtail/">Promtail</a></td>
        <td>The agent responsible for gathering logs and sending them to Loki</td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/">Grafana</a></td>
        <td>Allows to query, visualize, alert on, and explore metrics, logs, and traces no matter where it's stored.</td>
    </tr>
</table>
