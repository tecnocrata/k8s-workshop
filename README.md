# Kubernetes (k8s) Workshop

## Introduccion

Este repositorio contiene dos formas de `crear` un cluster de k8s, ambas tienen sus ventajas y desventajas, en terminos simples

- Si quiere evitarse muchos pasos y problemas de configuracion elija k8s-kubeadmin, sin embargo no tendra una herramienta de gestion y tendra que instalarla despues
- Si quiere entender algunos conceptos y como se configura K8s usando Rancher escoja k8s-rancher
- Un camino intermedio que combina varios pasos pero es mas simple que instalarlo con rancher, entonces usa k8s-k3s
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

  ## Gestion de Vegrant

  - Pausar las maquinas virtuales

    ```bash
    vagrant suspend
    ```

  - Restablecer las maquinas virtuales

    ```bash
    vagrant resume
    ```

## Recursos

- [Canal del autor de los scripts de k8s-kubeadmin](https://www.youtube.com/channel/UC6VkhPuCCwR_kG0GExjoozg)
- [Kubernetes explicado con diagramas](https://phoenixnap.com/kb/understanding-kubernetes-architecture-diagrams)
- [Tutorial de K8s para principiantes](https://www.youtube.com/watch?v=X48VuDVv0do)
