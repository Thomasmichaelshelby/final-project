#! /bin/bash
sudo -i
yum update -y
amazon-linux-extras install nginx1
systemctl start nginx

# rm -rf /etc/nginx/nginx.conf
cat > /etc/nginx/nginx.conf << EOF
    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log notice;
    pid        /var/run/nginx.pid;

    events {
        worker_connections  1024;
    }

    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$$remote_addr - $$remote_user [$$time_local] "$$request" '
                        '$$status $$body_bytes_sent "$$http_referer" '
                        '"$$http_user_agent" "$$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile            on;
        tcp_nopush          on;
        tcp_nodelay         on;
        keepalive_timeout  65;
        types_hash_max_size 4096;

        
        upstream tomcat {
            server 10.100.3.10:8080;
            }

        server {
            listen       80;
            listen  [::]:80;
            server_name  localhost;

            location / {
                proxy_pass http://tomcat;
                proxy_set_header Host $$host;
                proxy_set_header X-Real-IP $$remote_addr;
                proxy_set_header X-Forwarded-For $$proxy_add_x_forwarded_for;
            }
        }
    }
EOF

systemctl restart nginx