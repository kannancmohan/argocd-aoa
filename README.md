### Monitoring
The software stack used for monitoring system and applications. These tools allow to analyze real-time metrics of containers and nodes
<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="3">Monitoring Tools</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Installation</th>
    </tr>
    <tr>
        <td><a href="https://github.com/prometheus-operator/prometheus-operator">Prometheus Operator</a></td>
        <td>A kubernetes operator that automates the configuration and management of the Prometheus monitoring stack</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack">kube-prometheus-stack</a>  </td>
    </tr>
    <tr>
        <td><a href="https://prometheus.io/">Prometheus</a></td>
        <td>Monitoring & alerting solution that collects metrics data and stores that data in a time series database</td>
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
    <tr>
        <td><a href="https://grafana.com/">Grafana</a></td>
        <td>Allows to query, visualize, alert on, and explore metrics, logs, and traces no matter where it's stored.</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/grafana/grafana">Grafana helm chart</a>  </td>
    </tr>
</table>

### Logging
Loki, Promtail and Grafana is used for log aggregation and  visualization
<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="3">Logging Tools</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Installation</th>
    </tr>
    <tr>
        <td><a href="https://github.com/grafana/loki">Loki</a></td>
        <td>Inspired from prometheus, Loki is a datastore optimized for efficiently holding log data. It is a TSDB (Time-series database), it stores logs as split and gzipped chunks of data</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/grafana/loki-distributed">loki-distributed</a>  </td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/docs/loki/latest/send-data/promtail/">Promtail</a></td>
        <td>Promtail is a logs collector agent that collects, (re)labels and ships logs to Loki. </td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/grafana/promtail">promtail</a>  </td>
    </tr>
    <tr>
        <td><a href="https://grafana.com/">Grafana</a></td>
        <td>Allows to query and visualize logs</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/grafana/grafana">Grafana helm chart</a>  </td>
    </tr>
</table>

### Cluster management
<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="3">Management Tools</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Installation</th>
    </tr>
    <tr>
        <td><a href="https://github.com/cert-manager/cert-manager">Cert-manager</a></td>
        <td>Automatically provision and manage TLS certificates</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/cert-manager/cert-manager">cert-manager</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/external-secrets/external-secrets">External-secrets</a></td>
        <td>Kubernetes operator that integrates external secret management systems like AWS Secrets Manager, HashiCorp Vault, Google Secrets Manager etc</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/external-secrets-operator/external-secrets">external-secrets</a></td>
    </tr>
    <tr>
        <td><a href="https://github.com/vmware-tanzu/velero">Velero</a></td>
        <td>To backup and migrate Kubernetes applications and their persistent volumes</td>
        <td>TODO</td>
    </tr>
</table>

### Ingress
<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="3">Ingress Tools</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Installation</th>
    </tr>
    <tr>
        <td><a href="https://github.com/traefik/traefik">Traefik controller</a></td>
        <td>Kubernetes ingress controller</td>
        <td>Installed as part of <a href="https://artifacthub.io/packages/helm/traefik/traefik">traefik</a></td>
    </tr>
    <tr>
        <td>External-dns</td>
        <td></td>
        <td>TODO</td>
    </tr>
</table>

<table style='font-family:"Courier New", Courier, monospace; font-size:100%'>
    <tr>
        <th colspan="3">Cluster Services</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Namespace</th>
        <th>Port forward</th>
    </tr>
    <tr>
        <td><a href="https://argocd.dev.local/">Argocd</a></td>
        <td>argocd</td>
        <td>kubectl -n argocd port-forward svc/argocd-server 8080:443</td>
    </tr>
    <tr>
        <td>Traefik</td>
        <td>traefik</td>
        <td>kubectl port-forward deployments/traefik 2900:9000 --namespace traefik</td>
    </tr>
    <tr>
        <td>Prometheus</td>
        <td>kube-prometheus-stack</td>
        <td>kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 -n kube-prometheus-stack</td>
    </tr>
    <tr>
        <td>Prometheus-alertmanager</td>
        <td>kube-prometheus-stack</td>
        <td>kubectl port-forward svc/kube-prometheus-stack-alertmanager 9093:9093 -n kube-prometheus-stack</td>
    </tr>
    <tr>
        <td>Prometheus-node-exporter</td>
        <td>kube-prometheus-stack</td>
        <td>kubectl port-forward svc/kube-prometheus-stack-prometheus-node-exporter 9100:9100 -n kube-prometheus-stack</td>
    </tr>
    <tr>
        <td>Kube-state-metrics</td>
        <td>kube-prometheus-stack</td>
        <td>kubectl port-forward svc/kube-prometheus-stack-kube-state-metrics 9808:8080 -n kube-prometheus-stack</td>
    </tr>
    <tr>
        <td><a href="https://grafana.dev.local/d/efa86fd1d0c121a26444b636a3f509a8/kubernetes-compute-resources-cluster?orgId=1&refresh=10s">Grafana dashboard</a></td>
        <td>grafana</td>
        <td>kubectl port-forward svc/grafana 3000:80 -n grafana</td>
    </tr>
    <tr>
        <td>Loki - no gui</td>
        <td>loki</td>
        <td>kubectl -n loki port-forward svc/loki-loki-distributed-gateway 9080:80</td>
    </tr>
    <tr>
        <td>Promtail</td>
        <td>promtail</td>
        <td>kubectl port-forward svc/promtail-metrics 3101:3101 -n promtail</td>
    </tr>
    <tr>
        <td><a href="https://grafana.dev.local/d/o6-BGgnnk/loki-kubernetes-logs?orgId=1">Grafana logger dashboard</a></td>
        <td>grafana</td>
        <td>kubectl port-forward svc/grafana 3000:80 -n grafana</td>
    </tr>
</table>

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

### verify the ca files
```
openssl verify -CAfile \
<(kubectl -n cert-manager get secret self-signed-tls-cert -o jsonpath='{.data.ca\.crt}' | base64 -d) \
<(kubectl -n argocd get secret argocd-tls-cert -o jsonpath='{.data.tls\.crt}' | base64 -d)
```