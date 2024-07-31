#!/bin/bash

# Константы
FOLDER=~/myfolder
FILE2=$FOLDER/file2.txt

# Определение количества файлов в папке myfolder
file_count=$(find "$FOLDER" | wc -l)
echo "Количество файлов в папке myfolder: $file_count"

# Изменение прав доступа второго файла с 777 на 664
chmod 664 "$FILE2"

# Удаление пустых файлов
find "$FOLDER" -type f -empty -delete

# Удаление всех строк кроме первой в остальных файлах
for file in "$FOLDER"/*; do
  if [ -f "$file" ]; then
    sed -i '2,$d' "$file"
  fi
done
