#!/bin/bash

# Константы
FOLDER=~/myfolder
FILE1=$FOLDER/file1.txt
FILE2=$FOLDER/file2.txt
FILE3=$FOLDER/file3.txt
FILE4=$FOLDER/file4.txt
FILE5=$FOLDER/file5.txt

# Создание папки myfolder в домашней директории
mkdir -p "$FOLDER"

# Создание первого файла с приветствием и текущей датой и временем
echo -e "Привет!\n$(date)" > "$FILE1"

# Создание пустого файла с правами 777
touch "$FILE2"
chmod 777 "$FILE2"

# Создание файла с одной строкой длиной в 20 случайных символов
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 > "$FILE3"

# Создание двух пустых файлов
touch "$FILE4"
touch "$FILE5"
