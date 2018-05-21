FROM nginx:1.14.0-alpine
RUN : "nginx default.conf" && { \
      echo "server {"; \
      echo "    listen       80;"; \
      echo "    server_name  dot.raba.me;"; \
      echo "    rewrite ^ https://raw.githubusercontent.com/raba-jp/dotfiles/master/setup.sh;"; \
      echo "}"; \
    } | tee /etc/nginx/conf.d/default.conf
STOPSIGNAL SIGTERM
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
