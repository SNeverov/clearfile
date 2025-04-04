#!/usr/bin/env bash
set -e

echo "🔧 Обновляем систему и устанавливаем зависимости..."
apt update && apt install -y curl sudo gnupg apt-transport-https ca-certificates software-properties-common git unzip socat cron netcat lsb-release

echo "🐳 Устанавливаем Docker..."
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

echo "🧱 Устанавливаем Docker Compose..."
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo "📦 Загружаем и запускаем установку Hiddify Next..."
curl -L -o install.sh https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh
chmod +x install.sh
./install.sh
