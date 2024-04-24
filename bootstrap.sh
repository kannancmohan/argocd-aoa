#!/bin/bash

## Create new namespace "argocd"
kubectl create namespace argocd --dry-run=client --output=yaml | kubectl apply -f - &&

## Install argocd
helm template \
        --dependency-update --include-crds --namespace argocd \
        argocd ./k8s/cluster_apps/bootstrap/argocd \
        | kubectl apply -n argocd -f - &&

## Wait for argocd server 
echo 'Waiting for argocd server to start..' 
kubectl wait -n argocd  --timeout=120s --for condition=Ready pod -l app.kubernetes.io/name=argocd-server &&

## create argocd resource Project and ApplicationSet
helm template --namespace argocd argocd ./k8s/cluster_apps/bootstrap/root | kubectl apply -n argocd -f -

# echo "Creating 'alertmanager-smtp-secret' secret..."
# kubectl create secret generic alertmanager-smtp-secret --from-literal=auth_password="$SMTP_AUTH_PWD" --namespace kube-prometheus-stack
# kubectl create secret generic keycloak-credentials-secret --from-literal=admin-password="identity@keycloak" --from-literal=postgres-password="identity@keycloak" --from-literal=password="identity@keycloak" --namespace keycloak

