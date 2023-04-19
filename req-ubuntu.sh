#!/bin/bash

# Comprueba si el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Actualiza el sistema
echo "Actualizando el sistema..."
apt-get update && apt-get upgrade -y

# Instala los paquetes necesarios para VirtualBox
echo "Instalando dependencias para VirtualBox..."
apt-get install -y linux-headers-$(uname -r) build-essential dkms

# Instala VirtualBox
echo "Instalando VirtualBox..."
apt-get install -y virtualbox

# Instala libvirt
echo "Instalando libvirt..."
apt-get install -y libvirt-daemon-system libvirt-clients

# Instala Vagrant
echo "Instalando Vagrant..."
apt-get install -y vagrant

# Instala Docker
echo "Instalando Docker..."
apt-get install -y docker.io

# Habilita e inicia el servicio Docker
systemctl enable docker.service
systemctl start docker.service

# Agrega el usuario actual al grupo de Docker
echo "Agregando el usuario actual al grupo de Docker..."
usermod -aG docker "$(logname)"

# Instala kubectl
echo "Instalando kubectl..."
apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

echo "La instalación ha finalizado. Por favor, reinicia el sistema para aplicar todos los cambios."
