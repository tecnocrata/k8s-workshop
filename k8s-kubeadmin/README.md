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
- Ejecuta los siguientes comandos para hacer una prueba

![ kubectl commands ](/images/kubectl-commands.png)
