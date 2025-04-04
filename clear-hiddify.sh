#!/bin/bash

echo "[*] Остановка Docker-контейнеров Hiddify..."
docker ps -a -q --filter "name=hiddify" | xargs -r docker stop
docker ps -a -q --filter "name=hiddify" | xargs -r docker rm

echo "[*] Удаление файлов Hiddify..."
rm -rf /opt/hiddify-manager

echo "[*] Удаление Docker и зависимостей..."
apt purge -y docker.io docker-compose docker-ce docker-ce-cli containerd runc
apt autoremove -y
apt clean

echo "[*] Удаление остатков Docker..."
rm -rf /var/lib/docker
rm -rf /etc/docker
rm -rf /var/run/docker.sock

echo "[*] Готово. Рекомендуется перезагрузить систему."
