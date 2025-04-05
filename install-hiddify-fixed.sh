#!/bin/bash

echo "🔄 Обновление системы..."
apt update && apt upgrade -y

echo "📦 Установка зависимостей: curl, git, docker, docker-compose..."
apt install -y curl git docker.io docker-compose

echo "🚀 Запуск и автозагрузка Docker..."
systemctl start docker
systemctl enable docker

echo "🧹 Очистка старой установки Hiddify (если была)..."
cd /opt/Hiddify-Manager 2>/dev/null && docker-compose down
cd /opt && rm -rf Hiddify-Manager
docker image prune -a -f
docker volume prune -f

echo "📁 Клонирование репозитория Hiddify..."
cd /opt || exit
git clone https://github.com/hiddify/Hiddify-Manager.git
cd Hiddify-Manager || exit

echo "⚙️ Удаление строки с app.cfg из docker-compose.yml..."
sed -i '/app.cfg/d' docker-compose.yml

echo "⚙️ Создание .env по умолчанию (если не существует)..."
cp -n .env.example .env 2>/dev/null || touch .env

echo "📥 Загрузка и запуск контейнеров Hiddify..."
docker-compose pull
docker-compose up -d

IP=$(curl -s ifconfig.me)

echo ""
echo "✅ Hiddify успешно установлен!"
echo "🌐 Панель: https://$IP или http://$IP:8000"
echo "💡 Логин/пароль по умолчанию в .env или admin / admin"
