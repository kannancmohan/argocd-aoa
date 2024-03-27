#!/bin/bash

## Create new namespace "argocd"
kubectl create namespace argocd --dry-run=client --output=yaml | kubectl apply -f -

## Install argocd
helm template \
        --dependency-update --include-crds --namespace argocd \
        argocd ./k8s/cluster_apps/bootstrap/argocd \
        --set argo-cd.configs.secret.argocdServerAdminPassword=$ARGOCD_ADMIN_PWD \
        | kubectl apply -n argocd -f -

## create argocd resource Project and ApplicationSet
helm template \
        --namespace argocd \
        argocd ./k8s/cluster_apps/bootstrap/root \
        | kubectl apply -n argocd -f -