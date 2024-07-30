#!/bin/bash

# Создание папки myfolder в домашней директории
mkdir -p ~/myfolder

# Создание первого файла с приветствием и текущей датой и временем
echo -e "Привет!\n$(date)" > ~/myfolder/file1.txt

# Создание пустого файла с правами 777
touch ~/myfolder/file2.txt
chmod 777 ~/myfolder/file2.txt

# Создание файла с одной строкой длиной в 20 случайных символов
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 > ~/myfolder/file3.txt

# Создание двух пустых файлов
touch ~/myfolder/file4.txt
touch ~/myfolder/file5.txt
