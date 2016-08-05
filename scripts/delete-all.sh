
#!/bin/bash

kubectl delete -f frstack/pv-host.yaml
kubectl delete -f frstack/pvc.yaml
kubectl delete -f frstack/secrets.yaml
kubectl delete -f frstack/apache-agent.yaml
kubectl delete -f frstack/apache-service.yaml
kubectl delete -f frstack/resty.yaml
kubectl delete -f frstack/configMap.yaml
kubectl delete -f frstack/ingress.yaml
kubectl delete -f frstack/opendj.yaml
kubectl delete -f frstack/opendj-service.yaml
kubectl delete -f frstack/postgres.yaml
kubectl delete -f frstack/openam.yaml
kubectl delete -f frstack/openam-service.yaml
kubectl delete -f frstack/openidm.yaml
kubectl delete -f frstack/openig.yaml
kubectl delete -f frstack/ssoconfig.yaml
kubectl delete -f frstack/namespace.yaml
