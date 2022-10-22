#!/bin/bash
set -x

# AWS_ACCESS_KEY_ID=$1
# AWS_SECRET_ACCESS_KEY=$2
# KUBE_CLUSTER_NAME=$3
# BUILD_NUMBER=$4

# aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID} --profile eksconnect
# aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} --profile eksconnect
# aws configure set region us-east-1 --profile eksconnect
# aws eks update-kubeconfig --region us-east-1 --name ${KUBE_CLUSTER_NAME}
# sed -i \"s/hellonode:latest/hellonode:${BUILD_NUMBER}/g\" ./kubernetes/pod.yaml
# kubectl create secret docker-registry regcred --docker-server=rknaik76.jfrog.io --docker-username=rknaik76@gmail.com --docker-password=cmVmdGtuOjAxOjAwMDAwMDAwMDA6QVl5T3lReWVOalkxTW54MENweHRFY3VTVmdF --docker-email=rknaik76@gmail.com