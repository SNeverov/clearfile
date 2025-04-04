#!/usr/bin/env bash

echo "Обновляем систему и устанавливаем зависимости..."
apt update && apt install -y curl sudo gnupg apt-transport-https ca-certificates software-properties-common

echo "Устанавливаем Docker..."
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

echo "Загружаем и запускаем установку Hiddify Next..."
curl -L -o install.sh https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh
chmod +x install.sh
./install.sh
