#!/bin/bash
set -x

DEPLOYMENT=$1
DEPLOYMENT_YAML=$2
CONTAINER=$3
IMAGE=$4
IMAGE_TAG=$5

OUTPUT=`kubectl get deployments 2>/dev/null | grep $DEPLOYMENT`
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo "Deployment $DEPLOYMENT exists. Updating the new container image"
    kubectl set image deployment $DEPLOYMENT $CONTAINER=$IMAGE:$IMAGE_TAG
else
    echo "Deployment $DEPLOYMENT does not exist. Creating a fresh deployment"
    kubectl create -f $DEPLOYMENT_YAML
fi