# Kubernetes (k8s) Workshop

## Introduccion

Este repositorio contiene dos formas de `crear` un cluster de k8s, ambas tienen sus ventajas y desventajas, en terminos simples

- Si quiere evitarse muchos pasos y problemas de configuracion elija k8s-kubeadmin, sin embargo no tendra una herramienta de gestion y tendra que instalarla despues
- Si quiere entender algunos conceptos y como se configura K8s usando Rancher escoja k8s-rancher
- Cada folder tiene sus propias instrucciones y pre-requisitos a instalar, leealos atentamente.

## Configurar kubectl en la maquina host

- Descarga el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config`
- Ejecuta los siguientes comandos para hacer una prueba

  ```bash
  kubectl get pods
  kubectl run nginx --image=nginx:latest
  kubectl get all -o wide
  ```

## Gestion de Virtualbox

- Listado de redes creadas

  ```bash
  vboxmanage list hostonlyifs
  ip a s
  ```

- Borrado de redes

  ```bash
  vboxmanage hostonlyif remove <<network>>
  ```

## Recursos

- [Kubernetes explicado con diagramas](https://phoenixnap.com/kb/understanding-kubernetes-architecture-diagrams)
- [Tutorial de K8s para principiantes](https://www.youtube.com/watch?v=X48VuDVv0do)
