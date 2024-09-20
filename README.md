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

## 3. Build Images

```
docker compose build
```

It should show the following results:

```
Kubernetes resource db-deployment.yaml created
Kubernetes resource redis-deployment.yaml created
Kubernetes resource result-deployment.yaml created
Kubernetes resource vote-deployment.yaml created
Kubernetes resource worker-deployment.yaml created
Kubernetes resource db-expose.yaml created
Kubernetes resource redis-expose.yaml created
Kubernetes resource result-expose.yaml created
Kubernetes resource vote-expose.yaml created
Kubernetes resource 0-sample-voting-app-namespace.yaml created
Kubernetes resource back-tier-network-policy.yaml created
Kubernetes resource front-tier-network-policy.yaml created
Kubernetes resource db-db-data-persistentVolumeClaim.yaml created
Kubernetes resource db-/Users/ajeetsraina/meetup/sample-voting-app/healthchecks-persistentVolumeClaim.yaml created
Kubernetes resource redis-/Users/ajeetsraina/meetup/sample-voting-app/healthchecks-persistentVolumeClaim.yaml created
Kubernetes resource result-/Users/ajeetsraina/meetup/sample-voting-app/result-persistentVolumeClaim.yaml created
Kubernetes resource vote-/Users/ajeetsraina/meetup/sample-voting-app/vote-persistentVolumeClaim.yaml created
Kubernetes resource result-service.yaml created
Kubernetes resource vote-service.yaml created
Kubernetes resource kustomization.yaml created
Kubernetes resource db-db-data-persistentVolumeClaim.yaml created
Kubernetes resource db-/Users/ajeetsraina/meetup/sample-voting-app/healthchecks-persistentVolumeClaim.yaml created
Kubernetes resource redis-/Users/ajeetsraina/meetup/sample-voting-app/healthchecks-persistentVolumeClaim.yaml created
Kubernetes resource result-/Users/ajeetsraina/meetup/sample-voting-app/result-persistentVolumeClaim.yaml created
Kubernetes resource vote-/Users/ajeetsraina/meetup/sample-voting-app/vote-persistentVolumeClaim.yaml created
Kubernetes resource result-service.yaml created
Kubernetes resource vote-service.yaml created
Kubernetes resource kustomization.yaml created
```


## 3. Convert Compose to Kubernetes objects using Compose Bridge

```
compose-bridge convert
```

## 4. Create Kubernetes objects

```
kubectl apply -k out/overlays/desktop/
```

## 5. Check krs health > enter model name> Choose "sample-voting-app" to see the logs (edited) (edited) 

