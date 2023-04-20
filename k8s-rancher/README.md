# Instalacion de Kubernetes (k8s) con Rancher

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
cd k8s-rancher
vagrant up
```

## Configurando nodo a nodo

1. Obten la direccion IP de tu maquina local (el host, no de la virtual), recomiendo que sea una IP estatica, en mi caso sera `192.158.50.249` toma nota de esta direccion

   ```bash
   ip addr
   ```

1. Inicie sesion en cada nodo uno por uno, NO inicies las sesiones al mismo tiempo, ni ejecutes los comandos al mismo tiempo en los nodos, eso podria causar problemas posteriores. Empezamos con el nodo `192.168.56.211`. El password de cada nodo es `kubeadmin`

   ```bash
   ssh root@192.168.56.211
   ```

1. Instalar docker en cada nodo, copia el bloque de comandos y pegalo en la terminal donde iniciaste la sesion con ssh

   ```bash
   {
   apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
   add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   apt update && apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io
   }
   ```

1. Habilitar la comunicacion de cada nodo con la maquina host, recuerdas el IP de tu maquina host? reemplaza `192.168.50.249` por el tuyo y pega y ejecuta uno tras otro los comandos en la terminal de tu sesion ssh

   ```bash
   cat <<EOF > /etc/docker/daemon.json
   {
   "insecure-registries" : [ "192.168.50.249:5000" ]
   }
   EOF
   ```

   ```
   systemctl daemon-reload && systemctl restart docker
   ```

1. Repite desde el paso 2 ahora con los nodos `192.168.56.212` y `192.168.56.213`
   ```bash
    ssh root@192.168.56.212
   ```

## Levantar un registry privado

- Regresar a la terminal de la maquina host y ejecutar

  ```
  docker run -d -p 5000:5000 --restart always --name registry registry:2
  ```

- Verificar que el registry esta respondiendo, OBSERVA y cambia la IP por la tuya
  ```
  curl 192.168.50.249:5000/v2/_catalog
  ```
- La respuesta del anterior comando sera similar a:

  ```
  {"repositories":[]}
  ```

## Instalar Rancher en el nodo01

- Ejecutar el siguiente comando en la terminal con la sesion ssh iniciada en el nodo 1

```bash
docker run --privileged -d --restart=unless-stopped -v /opt/rancher:/var/lib/rancher -p 8080:80 -p 443:443 rancher/rancher
```

- Despues de uno o dos minutos puedes navegar hacia la direccion `https://192.168.56.211` y obtendras la siguiente advertencia, acepta el riesgo y continua

  ![ Advertencia de Seguridad](/images/rancher-warning.png)

- En la consola del nodo 1, configura el password de rancher, siguiendo las instrucciones que te aparecen en la siguiente pagina, recuerda que las instrucciones van a variar de maquina a maquina.

![ Rancher login ](/images/rancher-login.png)

- Una vez que hayas configurado el password recibiras una pantalla similar a esta:

![ Rancher welcome ](/images/rancher-welcome.png)

## Deployar el cluster de K8s

![ Cluster Management ](/images/rancher-cluster.png)

![ Create Cluster](/images/create-cluster.png)

![ Custom Cluster](/images/custom-cluster.png)

![ New Cluster Config ](/images/create-custom-config.png)

![ Cluster Node Config ](/images/cluster-node-registration.png)

![ Node Registration ](/images/node-registration.png)

## Configurar kubectl en la maquina host

- Descarga el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config`
- Ejecuta los siguientes comandos para hacer una prueba

```
kubectl get pods
kubectl run nginx --image=nginx:latest
kubect
```
