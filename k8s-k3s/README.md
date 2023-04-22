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
   curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
   ```

1. Ejecutar, para obtener el token (`mynodetoken`)

   ```
   cat  /var/lib/rancher/k3s/server/node-token
   ```

1. En cada nodo ejecutar

   ```bash
   curl -sfL https://get.k3s.io | K3S_URL=https://192.168.60.211:6443 K3S_TOKEN=mynodetoken sh -
   ```
   example: 
   ```
   curl -sfL https://get.k3s.io | K3S_URL=https://192.168.60.211:6443 K3S_TOKEN=K102d5ea79d5b8646429baf360b5594a4220d0204e5ff840eb379bfbec85813630c::server:0800f9be54f80c8ded78a0f7eb6fffe4 K3S_NODE_NAME="node-w2" sh -
   ```

1. Crear el archivo config en la siguiente ruta, ejecutando, modificar el IP dentro del archivo `config.yaml` de ser necesario:

   ```bash
   sudo mkdir /opt/rancher
   sudo mkdir /opt/rancher/rke2
   sudo cp config.yaml /opt/rancher/rke2/
   ```

1. Levantar rancher, observar los volumenes montados:

   ```bash
   docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher -v /opt/rancher/rke2:/etc/rancher/rke2 rancher/rancher

   ```

## Configurar kubectl en la maquina host

- Descarga el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config`
- Ejecuta los siguientes comandos para hacer una prueba
  ```
  kubectl get pods
  kubectl run nginx --image=nginx:latest
  kubectl
  ```
