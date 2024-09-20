# Deploy Voting app to Kubernetes using Compose Bridge

A simple distributed application running across multiple Docker containers.

## Prerequsiite

- Docker Desktop
- Enable Compose Bridge


  <img width="1319" alt="image" src="https://github.com/user-attachments/assets/9b8d5ce2-1836-455f-8e68-956cdbab2287">

- Enable Kubernetes

  

## Getting Started

## 1. Clone the repo

```
git clone https://github.com/kubetoolsca/sample-voting-app
```

## 2. Change directory

```
cd sample-voting-app
```


## 3. Convert Compose to Kubernetes objects using Compose Bridge

```
compose-bridge convert
```

## 4. Create Kubernetes objects

```
kubectl apply -k out/overlays/desktop/
```

## 5. Check krs health > enter model name> Choose "example-voting-app" to see the logs (edited) (edited) 

