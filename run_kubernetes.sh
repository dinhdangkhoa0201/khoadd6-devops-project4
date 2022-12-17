#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=dinhdangkhoa0201/khoadd6-devops-project4-api

# Step 2
# Run the Docker Hub container with kubernetes
r=$(kubectl get pod khoadd6-devops-project4-api 2> /dev/null;echo $?)

if [ "_$r" == "_1" ] ; then
  kubectl run khoadd6-devops-project4-api \
  --image=$dockerpath \
  --port=80 \
  --labels app=khoadd6-devops-project4-api
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward khoadd6-devops-project4-api 8080:80

