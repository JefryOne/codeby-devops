# Stage 1: Сборка WAR файла
FROM maven:3.8.5-openjdk-11 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта в контейнер
COPY pom.xml .
COPY src ./src

# Собираем проект и создаем WAR файл
RUN mvn clean package

# Stage 2: Развертывание на Tomcat
FROM tomcat:9.0.65-jdk11

# Устанавливаем рабочую директорию
WORKDIR /usr/local/tomcat/webapps

# Удаляем стандартное приложение ROOT
RUN rm -rf ROOT

# Копируем собранный WAR файл из предыдущего этапа
COPY --from=build /app/target/WebApp.war ./ROOT.war

# Открываем порт 8080
EXPOSE 8080

# Запускаем Tomcat
ENTRYPOINT ["catalina.sh", "run"]
