# Используем базовый образ Debian
FROM debian:11

# Устанавливаем nginx
RUN apt-get update && apt-get install -y nginx

# Создаем папку /opt/www и добавляем файл index.html
RUN mkdir -p /opt/www && echo '<h1>Hello from Debian Nginx</h1>' > /opt/www/index.html

# Копируем конфигурационный файл nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порт 80 для nginx
EXPOSE 80

# Запускаем nginx через ENTRYPOINT
ENTRYPOINT ["nginx", "-g", "daemon off;"]
