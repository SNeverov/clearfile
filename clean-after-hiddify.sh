#!/bin/bash

echo "🧹 Отключаем службы, не нужные после Hiddify..."

# Остановка и отключение MariaDB
echo "⛔️ Остановка MariaDB..."
systemctl stop mariadb 2>/dev/null
systemctl disable mariadb 2>/dev/null

# Остановка и отключение Docker
echo "⛔️ Остановка Docker..."
systemctl stop docker 2>/dev/null
systemctl disable docker 2>/dev/null

# Остановка и отключение unattended-upgrades
echo "⛔️ Отключение unattended-upgrades..."
systemctl stop unattended-upgrades 2>/dev/null
systemctl disable unattended-upgrades 2>/dev/null

# Удаление MariaDB и Docker
echo "❌ Удаление MariaDB и Docker..."
apt purge -y mariadb-server mariadb-client docker.io docker-compose
apt autoremove -y
apt clean

# Очистка памяти (кешей)
echo "🧠 Очистка RAM (drop_caches)..."
sync && echo 3 > /proc/sys/vm/drop_caches

echo "✅ Очистка завершена. Система готова к бою!"
