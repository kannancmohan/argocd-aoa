### Add a secret including postgres database credentials

eg:
```
host: <service-name>.<namespace>.svc.cluster.local
port: 5432
dbname: app
dbuser: app
dbuser_password: <password>
dbadmin: postgres
dbadmin_password: <password>
```

### Default admin user 
```
username: zitadel-admin@zitadel.localhost
password: Password1!
```
https://zitadel.com/docs/self-hosting/deploy/compose