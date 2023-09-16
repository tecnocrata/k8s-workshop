# Apache Deploy & Service with a Load Balancer

The purpose of this example is to verify we are able to get a SVC with a Load Balancer assigning an IP address

```sh
kubectl apply -f load-balancer-demo-namespace.yaml --v=4
kubectl apply -f apache-deployment.yaml --v=6
kubectl apply -f apache-service.yaml --v=6

```