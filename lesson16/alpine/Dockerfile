# Используем базовый образ Alpine
FROM alpine:latest

# Устанавливаем nginx
RUN apk update && apk add nginx

# Создаем папку /opt/www и добавляем файл index.html
RUN mkdir -p /opt/www && echo '<h1>Hello from Alpine Nginx</h1>' > /opt/www/index.html

# Копируем конфигурационный файл nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порт 80 для nginx
EXPOSE 80

# Запускаем nginx через CMD
CMD ["nginx", "-g", "daemon off;"]
