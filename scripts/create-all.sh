#!/bin/bash

kubectl get namespace forgerock &> /dev/null

if [ $? -eq 0 ]; then
    echo "Namespace 'forgerock' already exists."
else
    kubectl create -f frstack/namespace.yaml
fi

kubectl create -f frstack/pv-host.yaml
kubectl create -f frstack/pvc.yaml
kubectl create -f frstack/secrets.yaml
kubectl create -f frstack/apache-agent.yaml
kubectl create -f frstack/apache-service.yaml
kubectl create -f frstack/resty.yaml
kubectl create -f frstack/configMap.yaml
kubectl create -f frstack/ingress.yaml
kubectl create -f frstack/opendj.yaml
kubectl create -f frstack/opendj-service.yaml
kubectl create -f frstack/postgres.yaml
kubectl create -f frstack/openam.yaml
kubectl create -f frstack/openam-service.yaml
kubectl create -f frstack/openidm.yaml
kubectl create -f frstack/openig.yaml
kubectl create -f frstack/ssoconfig.yaml
