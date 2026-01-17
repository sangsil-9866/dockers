#!/bin/bash

echo "🚀 Starting custom entrypoint script..."

# SSL 키 비밀번호 등록
if [ -n "$SSL_KEY_PASSWORD" ]; then
    echo "🔐 Setting up SSL Keystore..."

    # 기존 키가 있다면 삭제 (에러 무시)
    /usr/share/elasticsearch/bin/elasticsearch-keystore remove xpack.security.http.ssl.secure_key_passphrase > /dev/null 2>&1 || true
    /usr/share/elasticsearch/bin/elasticsearch-keystore remove xpack.security.transport.ssl.secure_key_passphrase > /dev/null 2>&1 || true

    # 비밀번호 등록
    echo "$SSL_KEY_PASSWORD" | /usr/share/elasticsearch/bin/elasticsearch-keystore add -x -f 'xpack.security.http.ssl.secure_key_passphrase'
    echo "$SSL_KEY_PASSWORD" | /usr/share/elasticsearch/bin/elasticsearch-keystore add -x -f 'xpack.security.transport.ssl.secure_key_passphrase'

    echo "✅ SSL Keystore setup complete."
fi

echo "🚀 Executing original docker-entrypoint..."
exec /usr/local/bin/docker-entrypoint.sh "$@"

# (⚠️ 작성 후 반드시 chmod +x entrypoint.sh 명령어로 실행 권한을 주세요)