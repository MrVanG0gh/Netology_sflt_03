# Домашнее задание к занятию 3 "Резервное копирование" - `Иншаков Владимир`

---

### Задание 1

-   Составьте команду rsync, которая позволяет создавать зеркальную копию домашней директории пользователя в директорию /tmp/backup
-   Необходимо исключить из синхронизации все директории, начинающиеся с точки (скрытые)
-   Необходимо сделать так, чтобы rsync подсчитывал хэш-суммы для всех файлов, даже если их время модификации и размер идентичны в источнике и приемнике.
-   На проверку направить скриншот с командой и результатом ее выполнения

---

### Решение 1

Скриншоты:

![Screen1](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/screens/Screen1_1.png)
Команда для выполнения резервного копирования согласно заданию
```
sudo rsync -ac /home/van/ /tmp/backup/ --exclude '.*' --progress
```
![Screen2](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/screens/Screen1_2.png)
Результат работы команды
![Screen3](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/screens/Screen1_3.png)
Сравнение содержимого директорий

---

### Задание 2


-   Написать скрипт и настроить задачу на регулярное резервное копирование домашней директории пользователя с помощью rsync и cron.
-   Резервная копия должна быть полностью зеркальной
-   Резервная копия должна создаваться раз в день, в системном логе должна появляться запись об успешном или неуспешном выполнении операции
-   Резервная копия размещается локально, в директории /tmp/backup
-   На проверку направить файл crontab и скриншот с результатом работы утилиты.

---

### Решение 2

![Screen1](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/screens/Screen2_1.png)
Результат работы скрипта
![Screen2](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/screens/Screen2_2.png)
Сравнение исходной и конечной директорий

Файл crontab:
```
# Edit this file to introduce tasks to be run by cron.
# 
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
# 
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
# 
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# 
# For more information see the manual pages of crontab(5) and cron(8)
# 
# m h  dom mon dow   command

0 0 * * * /bin/backup_script.sh

```
Скрипт:
```
#!/bin/bash

rsync -ac /home/van/ /tmp/backup/ --delete --progress
if [ $? = 0 ]
then
echo 'the backup was succesfully created at' $(date) >> /var/log/neto_backup.log
else
echo "there is an error during backupping at" $(date) >> /var/log/neto_backup.log
fi
```

[crontab file](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/files/crontab)
[bash script](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/files/backup_script.sh)
[log file](https://github.com/MrVanG0gh/Netology_sflt_03/blob/main/files/neto_backup.log)
