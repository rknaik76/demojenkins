#!/bin/bash
set -x

SERVICE_NAME=$1
SERVICE_YAML=$2

OUTPUT=`kubectl get service 2>/dev/null | grep ${SERVICE_NAME}`
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo "Kubernetes service is already present. No action needed."
else
    echo "Kubernetes service does not exist. Creating new secret"
    kubectl create -f ${SERVICE_YAML}
fi