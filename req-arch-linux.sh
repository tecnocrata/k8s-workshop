#!/bin/bash

# Comprueba si el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Actualiza el sistema
echo "Actualizando el sistema..."
pacman -Syu --noconfirm

# Instala VirtualBox
echo "Instalando VirtualBox..."
pacman -S --noconfirm virtualbox virtualbox-host-modules-arch

# Instala libvirt
echo "Instalando libvirt..."
pacman -S --noconfirm libvirt

# Habilita e inicia el servicio libvirtd
systemctl enable libvirtd.service
systemctl start libvirtd.service

# Instala Vagrant
echo "Instalando Vagrant..."
pacman -S --noconfirm vagrant

# Instala Docker
echo "Instalando Docker..."
pacman -S --noconfirm docker

# Habilita e inicia el servicio Docker
systemctl enable docker.service
systemctl start docker.service

# Agrega el usuario actual al grupo de Docker
echo "Agregando el usuario actual al grupo de Docker..."
usermod -aG docker "$(logname)"

# Instala kubectl
echo "Instalando kubectl..."
pacman -S --noconfirm kubectl

echo "La instalación ha finalizado. Por favor, reinicia el sistema para aplicar todos los cambios."
