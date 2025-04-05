#!/usr/bin/env bash

echo "[1/5] Останавливаем и отключаем Docker и containerd..."
systemctl stop docker 2>/dev/null
systemctl disable docker 2>/dev/null
systemctl stop containerd 2>/dev/null
systemctl disable containerd 2>/dev/null

echo "[2/5] Удаляем Docker, containerd и зависимости..."
apt purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin
apt autoremove -y
apt clean

echo "[3/5] Удаляем остаточные файлы Docker..."
rm -rf /var/lib/docker /var/lib/containerd /etc/docker ~/.docker

echo "[4/5] Удаляем Hiddify..."
rm -rf /opt/hiddify-manager /etc/hiddify /var/log/hiddify /var/lib/hiddify

echo "[5/5] Удаляем установочные скрипты..."
rm -f ~/install.sh ~/install-hiddify.sh ~/install-hiddify-final.sh

echo "✅ Всё удалено. При необходимости перезагрузите сервер: reboot"
