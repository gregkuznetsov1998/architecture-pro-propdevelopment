#!/bin/bash
set -e

echo "Подписываем CSR пользователей сертификатом minikube..."

# Находим путь до CA minikube (может отличаться в зависимости от ОС и драйвера)
MINIKUBE_CA_PATH="/var/lib/minikube/certs/ca.crt"
MINIKUBE_CA_KEY_PATH="/var/lib/minikube/certs/ca.key"

# Проверяем, что пути существуют
if [[ ! -f $MINIKUBE_CA_PATH || ! -f $MINIKUBE_CA_KEY_PATH ]]; then
    echo "Не найдены CA файлы minikube. Убедитесь, что minikube запущен."
    exit 1
fi

# Подписываем сертификат для Alice
openssl x509 -req -in user-keys/alice.csr -CA $MINIKUBE_CA_PATH -CAkey $MINIKUBE_CA_KEY_PATH -CAcreateserial -out user-keys/alice.crt -days 365
# Подписываем сертификат для Bob
openssl x509 -req -in user-keys/bob.csr -CA $MINIKUBE_CA_PATH -CAkey $MINIKUBE_CA_KEY_PATH -CAcreateserial -out user-keys/bob.crt -days 365

echo "Сертификаты подписаны и лежат в user-keys/"