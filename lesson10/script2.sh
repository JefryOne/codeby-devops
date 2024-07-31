#!/bin/bash

# Определение количества файлов в папке myfolder
file_count=$(ls ~/myfolder | wc -l)
echo "Количество файлов в папке myfolder: $file_count"

# Изменение прав доступа второго файла с 777 на 664
chmod 664 ~/myfolder/file2.txt

# Удаление пустых файлов
find ~/myfolder -type f -empty -delete

# Удаление всех строк кроме первой в остальных файлах
for file in ~/myfolder/*; do
  if [ -f "$file" ]; then
    sed -i '2,$d' "$file"
  fi
done

