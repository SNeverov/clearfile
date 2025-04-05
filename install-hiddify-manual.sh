#!/bin/bash

echo "🔄 Обновление системы..."
apt update && apt upgrade -y

echo "📦 Установка зависимостей: curl, git, docker, docker-compose..."
apt install -y curl git docker.io docker-compose

echo "🚀 Запуск и автозагрузка Docker..."
systemctl start docker
systemctl enable docker

echo "📁 Клонирование репозитория Hiddify..."
cd /opt || exit
git clone https://github.com/hiddify/Hiddify-Manager.git
cd Hiddify-Manager || exit

echo "⚙️ Создание .env по умолчанию (если не существует)..."
cp -n .env.example .env

echo "📥 Загрузка и запуск контейнеров Hiddify..."
docker-compose pull
docker-compose up -d

IP=$(curl -s ifconfig.me)

echo ""
echo "✅ Hiddify успешно установлен!"
echo "🌐 Открой в браузере: https://$IP"
echo "🛠 Если HTTPS не работает — попробуй http://$IP:8000"
echo ""
echo "💡 Панель доступна с логином/паролем по умолчанию (или указанным в .env)"
