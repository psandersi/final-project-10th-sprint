#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
mkdir task
cd task
mkdir dir1
mkdir dir2
mkdir dir3
cd dir3
mkdir dir4
# изменяем текущую директорию на task
cd ..
# создаём пустой файл task/dir2/empty
touch dir2/empty
# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo '#!/bin/bash
echo "$1, привет!"' > dir2/hello.sh
# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh
# сохраняем список файлов task/dir2 в task/dir2/list.txt
cd dir2
touch list.txt
ls -r > list.txt
cd ..
# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2 dir3/dir4
# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
cd dir1
touch summary.txt
cd ..
find -iname '*.txt' >  dir1/summary.txt
# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir1/summary.txt >> dir2/list.txt
# определяем переменную окружения NAME со значением "Всем студентам"
VAR="Всем студентам"
# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
VAR | cat dir2/hello.sh >> dir1/summary.txt 
# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
touch Практическое задание
mv dir1/summary.txt Практическое задание
# выводим на консоль содержимое файла task/Практическое задание
cat Практическое задание
# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" Практическое задание | sort 
# меняем текущую директорию на родительскую для task
cd ..
# удаляем директорию task со всем содержимым
rm -rf task