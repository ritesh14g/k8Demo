#!/bin/bash
set -e
 
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
 
echo "Installing kind..."
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
 
echo "Creating Kubernetes cluster..."
kind create cluster --name devops-cluster
 
echo "Verifying cluster..."
kubectl cluster-info
kubectl get nodes
 
echo "Setup complete."
