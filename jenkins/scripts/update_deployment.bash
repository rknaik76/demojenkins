#!/bin/bash
set -x

DEPLOYMENT=$1
DEPLOYMENT_YAML=$2
CONTAINER=$3
IMAGE=$4
IMAGE_TAG=$5
SECRET_NAME=$6
JFROG_REPO=$7
JFROG_USR=$8
JFROG_PSW=$9

OUTPUT=`kubectl get secrets 2>/dev/null | grep $SECRET_NAME`
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo "Kubernetes docker secret is already present. No action needed."
else
    echo "Kubernetes docker secret does not exist. Creating new secret"
    kubectl create secret docker-registry regcred --docker-server=${JFROG_REPO} --docker-username=${$JFROG_USR} --docker-password=${JFROG_PSW} --docker-email=${$JFROG_USR}
fi

OUTPUT=`kubectl get deployments 2>/dev/null | grep $DEPLOYMENT`
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo "Deployment $DEPLOYMENT exists. Updating the new container image"
    kubectl set image deployment $DEPLOYMENT $CONTAINER=$IMAGE:$IMAGE_TAG
else
    echo "Deployment $DEPLOYMENT does not exist. Creating a fresh deployment"
    kubectl create -f $DEPLOYMENT_YAML
fi