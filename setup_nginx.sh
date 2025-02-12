#!/usr/bin/env bash
# Install and configure Nginx on Render

# Install Nginx
apt-get update -y
apt-get install -y nginx

cat <<EOF > /etc/nginx/nginx.conf
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    upstream app {
        server 127.0.0.1:8000;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://app;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
            proxy_set_header Connection "upgrade";
            proxy_cache_bypass \$http_upgrade;
        }
    }
}
EOF

# Restart Nginx
service nginx restart
