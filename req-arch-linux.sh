#!/bin/bash

# Comprueba si el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root" >&2
    exit 1
fi

# Actualiza el sistema
echo "Actualizando el sistema..."
pacman -Syu --noconfirm

install_package () {
    if ! pacman -Q $1 &> /dev/null
    then
        echo "Instalando $1..."
        pacman -S --noconfirm $1
    else
        echo "$1 ya está instalado"
    fi
}

# Instalar dependencias
install_package base-devel 
install_package git
install_package curl

# Instala VirtualBox
install_package virtualbox 
install_package virtualbox-host-modules-arch

# Instala libvirt y Virtual Machine Manager (virt-manager)
install_package libvirt 
install_package virt-manager 
install_package qemu

# Habilita e inicia el servicio libvirtd
systemctl enable libvirtd.service
systemctl start libvirtd.service

# Instala Vagrant
install_package vagrant

# Instala Docker
install_package docker

# Agregar el usuario actual al grupo de Docker para no requerir sudo
usermod -aG docker $USER
newgrp docker

# Habilita e inicia el servicio Docker
systemctl enable docker.service
systemctl start docker.service

# Instala kubectl
install_package kubectl

echo "La instalación ha finalizado. Por favor, reinicia el sistema para aplicar todos los cambios."
