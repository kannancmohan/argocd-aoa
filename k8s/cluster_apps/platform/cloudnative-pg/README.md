### Test connection
#### port forward the service
```
kubectl -n cloudnative-pg port-forward svc/cloudnative-pg-cluster-rw 5432:5432
```
#### test database using psql
```
psql "host=localhost port=5432 dbname=app user=app password=your-user-pwd"
```
