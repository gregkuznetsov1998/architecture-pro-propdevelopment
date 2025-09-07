#!/bin/bash
set -e

echo "Создаем ключи и CSR для пользователей..."

# Создаем папку для ключей
mkdir -p user-keys

# Создаем приватный ключ для Alice
openssl genrsa -out user-keys/alice.key 2048
# Создаем CSR для Alice. 
openssl req -new -key user-keys/alice.key -out user-keys/alice.csr -subj "/CN=alice/O=view-group"

# Создаем приватный ключ для Bob
openssl genrsa -out user-keys/bob.key 2048
# Создаем CSR для Bob. Важно: CN - имя пользователя, O - группа
openssl req -new -key user-keys/bob.key -out user-keys/bob.csr -subj "/CN=bob/O=dev-group"

echo "CSR и приватные ключи созданы в папке user-keys/"