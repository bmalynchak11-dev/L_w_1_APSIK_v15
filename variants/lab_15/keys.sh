#!/usr/bin/env bash
set -e

# Генерація ключа типу ed25519 без парольної фрази у "тихому" режимі (-q)
ssh-keygen -q -t ed25519 -N "" -f deploy_key

# Створення authorized_keys з необхідними опціями
printf "no-port-forwarding,no-pty %s\n" "$(cat deploy_key.pub)" > authorized_keys

# Встановлення обов'язкових прав доступу
chmod 600 authorized_keys
chmod 600 deploy_key
chmod 644 deploy_key.pub