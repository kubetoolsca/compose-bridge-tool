# Deploy Voting app to Kubernetes using Compose Bridge

A simple distributed application running across multiple Docker containers.

## Prerequsiite

- Docker Desktop
- Enable Compose Bridge
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

## 3. Let's target voting service.

```
cd vote
```

## 4. Convert Compose to Kubernetes objects using Compose Bridge

```
compose-bridge convert
```

## 5. Create Kubernetes objects

```
kubectl apply -k out/overlays/desktop/
```

## 6. Check krs health > enter model name> Choose "example-voting-app" to see the logs (edited) (edited) 

