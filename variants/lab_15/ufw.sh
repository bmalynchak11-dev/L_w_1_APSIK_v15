#!/usr/bin/env bash
set -e

# Скидання існуючих правил (за потреби для чистого стану)
ufw --force reset

# Типові політики: заборонити всі вхідні, дозволити вихідні
ufw default deny incoming
ufw default allow outgoing

# Дозволити SSH (порт 22/tcp)
ufw allow 22/tcp

# Дозволити діапазон портів для розробки 3000:3010/tcp
ufw allow 3000:3010/tcp

# Вставка екстреного блокування шкідливого IP на позицію 1
ufw insert 1 deny from 192.168.99.99

# Увімкнення фаєрвола без інтерактивного підтвердження
ufw --force enable