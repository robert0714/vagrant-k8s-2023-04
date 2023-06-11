#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
KUBE_VERSION=1.24.13-00

sudo apt-get update
sudo apt-get install --quiet --yes apt-transport-https ca-certificates curl

# https://github.com/kubernetes/kubernetes/issues/118462
# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://dl.k8s.io/apt/doc/apt-key.gpg 
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list 
sudo apt-get update
sudo apt-get install --quiet --yes kubelet=$KUBE_VERSION kubeadm=$KUBE_VERSION kubectl=$KUBE_VERSION
sudo apt-mark hold kubelet kubeadm kubectl
