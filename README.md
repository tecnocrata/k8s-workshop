# Kubernetes (k8s) Workshop

## Introduccion

Este repositorio contiene dos formas de `crear` un cluster de k8s, ambas tienen sus ventajas y desventajas, en terminos simples

- Si quiere evitarse muchos pasos y problemas de configuracion elija k8s-kubeadmin, sin embargo no tendra una herramienta de gestion y tendra que instalarla despues
- Si quiere entender algunos conceptos y como se configura K8s usando Rancher escoja k8s-rancher
- Cada folder tiene sus propias instrucciones y pre-requisitos a instalar, leealos atentamente.

## Configurar kubectl en la maquina host

- Descarga el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config`
- Ejecuta los siguientes comandos para hacer una prueba

```
kubectl get pods
kubectl run nginx --image=nginx:latest
kubect
```
