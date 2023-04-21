# Kubernetes (k8s) Workshop

## Instalacion de pre-requisitos

### Arch-Linux

```bash
sudo ./req-arch-linux.sh
```

### Ubuntu

```bash
sudo ./req-ubuntu.sh
```

## Iniciando las maquinas virtuales y futuros nodos

```bash
cd k8s-kubeadmin
vagrant up
```

## Verificando nodos

```bash
vagrant status
```

![ Vagrant status ](/images/vagrant-status.png)

## Configurando kubectl en la maquina host

- Copia el archivo de configuracion de kubernetes y colocalo dentro de `~/.kube/config` usando, el password de los nodos es `kubeadmin`:
  ```bash
  scp root@192.168.58.100:/etc/kubernetes/admin.conf ~/.kube/config
  ```
- Ejecuta los siguientes comandos para hacer una prueba basica

![ kubectl commands ](/images/kubectl-commands.png)

## Deployar un pod con nginx

- Ejecuta los siguientes comandos

  ```bash
   kubectl create deploy nginx --image nginx
   kubectl get all
  ```

  ![ nginx pod running ](/images/nginx-running.png)

- Creamos un servicio con un puerto aleatorio en un nodo del cluster host, ejecutar

  ```bash
  kubectl expose deploy nginx --port 80 --type NodePort
  ```

  ![ service exposed ](/images/service-exposed.png)

- Nginx esta corriendo y verificamos, recuerda que el puerto sera diferente, en tu caso:

```bash
curl 192.168.58.100:<<port>>
```

![ nginx exposed ](/images/nginx-exposed.png)

![ nginx node ](/images/nginx-node.png)
