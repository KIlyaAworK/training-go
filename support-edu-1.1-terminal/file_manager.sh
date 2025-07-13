#!/bin/bash
echo "Использование: $1 путь_к_директории"
  
dir="$1"

txt_count=0
exec_count=0
empty_dir_count=0

for item in "$dir"/*; do
  if [[ -f "$item" ]]; then
    if [[ "$item" == *.txt ]]; then
      echo "Файл: $item (первые 3 строки):"
      head -n 3 "$item"
      echo
      ((txt_count++))
    fi
    if [[ -x "$item" ]]; then
      size=$(stat -c%s "$item")
      echo
      ((exec_count++))
    fi

  elif [[ -d "$item" ]]; then
    if [[ -z "$(ls -A "$item")" ]]; then
      echo "Пустая директория - $item"
      ((empty_dir_count++))
      echo
    fi
  fi
done

# Вывод статистики
echo "Статистика:"
echo "Текстовых файлов: $txt_count"
echo "Исполняемых файлов: $exec_count"
echo "Пустых директорий: $empty_dir_count"
