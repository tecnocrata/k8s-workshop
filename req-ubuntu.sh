#!/bin/bash

# Comprueba si el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Actualiza el sistema
echo "Actualizando el sistema..."
apt-get update && apt-get upgrade -y

# Instala dependencias
echo "Instalando dependencias para VirtualBox..."
apt-get install -y curl git
apt-get install -y linux-headers-$(uname -r) build-essential dkms

# Instala VirtualBox
echo "Instalando VirtualBox..."
apt-get install -y virtualbox

# Instalar libvirt y Virtual Machine Manager (virt-manager)
echo "Instalando libvirt..."
apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# Habilitar e iniciar el servicio Libvirt
systemctl enable libvirtd.service
systemctl start libvirtd.service

# Instala Vagrant
echo "Instalando Vagrant..."
apt-get install -y vagrant
# curl -O https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
# dpkg -i vagrant_2.2.19_x86_64.deb
# rm vagrant_2.2.19_x86_64.deb

# Instala Docker
echo "Instalando Docker..."
# apt-get install -y docker.io
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

# Habilita e inicia el servicio Docker
systemctl enable docker.service
systemctl start docker.service

# Agrega el usuario actual al grupo de Docker para no requerir sudo
usermod -aG docker $SUDO_USER
newgrp docker

# Instala kubectl
# snap install kubectl --classic
echo "Instalando kubectl..."
apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

echo "La instalación ha finalizado. Por favor, reinicia el sistema para aplicar todos los cambios."
