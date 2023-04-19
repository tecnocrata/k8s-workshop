#!/bin/bash

# Comprueba si el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Actualiza el sistema
echo "Actualizando el sistema..."
pacman -Syu --noconfirm

# Instalar dependencias
pacman -S --noconfirm --needed base-devel git curl

# Instala VirtualBox
echo "Instalando VirtualBox..."
pacman -S --noconfirm virtualbox virtualbox-host-modules-arch

# Instala libvirt y Virtual Machine Manager (virt-manager)
echo "Instalando libvirt..."
pacman -S --noconfirm libvirt virt-manager qemu

# Habilita e inicia el servicio libvirtd
systemctl enable libvirtd.service
systemctl start libvirtd.service

# Instala Vagrant
echo "Instalando Vagrant..."
pacman -S --noconfirm vagrant
# curl -O https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.tar.gz
# tar -xzf vagrant_2.2.19_x86_64.tar.gz
# mv vagrant /usr/local/bin/
# rm vagrant_2.2.19_x86_64.tar.gz

# Instala Docker
echo "Instalando Docker..."
pacman -S --noconfirm docker

# Agregar el usuario actual al grupo de Docker para no requerir sudo
usermod -aG docker $USER
newgrp docker

# Habilita e inicia el servicio Docker
systemctl enable docker.service
systemctl start docker.service

# Instala kubectl
echo "Instalando kubectl..."
pacman -S --noconfirm kubectl

echo "La instalación ha finalizado. Por favor, reinicia el sistema para aplicar todos los cambios."
