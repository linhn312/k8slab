server {
    listen 80;
    server_name linhn312.com www.linhn312.com;
location / {
        proxy_pass ${wp_url};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
