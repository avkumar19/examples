#!/bin/sh

#cloning the project sample repository
sudo git clone https://github.com/avkumar19/examples.git
cd examples/guestbook
#Creating pods and services
kubectl apply -f <( istioctl kube-inject -f redis-master-deployment.yaml)
kubectl apply -f <( istioctl kube-inject -f redis-master-service.yaml)
kubectl apply -f <( istioctl kube-inject -f redis-slave-deployment.yaml)
kubectl apply -f <( istioctl kube-inject -f redis-slave-service.yaml)
kubectl apply -f <( istioctl kube-inject -f frontend-deployment.yaml)
kubectl apply -f <( istioctl kube-inject -f frontend-service.yaml)
#Checking running services
kubectl get svc
#Getting External Ip to access
kubectl get svc frontend -o wide
