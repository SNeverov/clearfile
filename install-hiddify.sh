#!/bin/bash

# Обновляем и устанавливаем curl, sudo, gnupg, apt-transport-https
apt update && apt install -y curl sudo gnupg apt-transport-https ca-certificates software-properties-common

# Устанавливаем Docker
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

# Скачиваем и запускаем инсталлятор Hiddify Next
curl -L -o install.sh https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh
chmod +x install.sh
./install.sh
