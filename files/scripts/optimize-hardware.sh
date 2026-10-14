#!/usr/bin/env bash
set -xeuo pipefail

echo "Habilitando firmware privativo para la aceleración gráfica..."
sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources || true

echo "Formateando variables de entorno para rendimiento..."
mkdir -p /etc/environment.d
echo "LIBGL_ALWAYS_SOFTWARE=0" >> /etc/environment
echo "VDPAU_DRIVER=radeon" >> /etc/environment

sed -i 's/#user-session=default/user-session=xfce/g' /etc/lightdm/lightdm.conf

bootc container lint
