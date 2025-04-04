#!/bin/bash

echo "[*] Обновление системы..."
apt update && apt upgrade -y

echo "[*] Установка зависимостей..."
apt install -y curl wget sudo git socat cron netcat unzip bash apt-transport-https ca-certificates gnupg lsb-release

echo "[*] Установка Docker..."
curl -fsSL https://get.docker.com | bash

echo "[*] Установка Docker Compose..."
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo "[*] Загрузка и установка Hiddify..."
bash -c "$(curl -L https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh)"

echo "[*] Установка завершена. Перезагрузите сервер или дождитесь запуска панели."
