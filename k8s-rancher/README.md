# Instalacion de Kubernetes (k8s) con k3s

## Instalacion de pre-requisitos

### Arch-Linux

```bash
sudo ./req-arch-linux.sh
```

### Ubuntu

```bash
sudo ./req-ubuntu.sh
```

## Iniciando el cluster

```bash
cd k8s-k3s
vagrant up
```

## Instalando k3s

Para instrucciones mas detalladas [k3s](https://docs.k3s.io/quick-start)

1. En el nodo master ejecutar

   ```bash
   curl -sfL https://get.k3s.io | sh -
   ```

1. En cada nodo ejecutar

   ```bash
   curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
   ```

## Configurar kubectl en la maquina host

- Descarga el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config`
- Ejecuta los siguientes comandos para hacer una prueba
  ```
  kubectl get pods
  kubectl run nginx --image=nginx:latest
  kubectl
  ```
