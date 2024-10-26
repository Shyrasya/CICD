# CI/CD

## Содержание

1. [О проекте](#о-проекте)

## О проекте

В данном учебном проекте "Школы 21" необходимо было сформировать отчет о разработке простого CI/CD для проекта [Simple Bash Utils](https://github.com/Shyrasya/SimpleBashUtils). Этапы CI/CD включали в себя сборку проекта, его тестирование и развертывание на другой машине. Вся работа происходит в VirtualBox на виртуальной машине Ubuntu 20.04 Server LTS. Подготовленный отчет находится в папке [src/report.md](https://github.com/Shyrasya/CICD/blob/main/src/report.md). Файлы со скриптами и gitlab-ci.yml лежат в каталоге [src](https://github.com/Shyrasya/CICD/tree/main/src).

### Список изученных тем:

* Настройка gitlab-runner;
* Этап CI (сборка проекта) в gitlab-ci.yml;
* Этап CI (проверка кодстайла) в gitlab-ci.yml через запуск скрипта (style_check.sh);
* Этап CI (запуск интеграционных тестов) в gitlab-ci.yml через запуск скрипта (to_test.sh);
* Этап CD (развертывание проекта на другой виртуальной машине при помощи ssh и scp) в gitlab-ci.yml через запуск скрипта (copy_artef.sh);
* Настройка уведомлений о выполнении пайплайна через Telegram-бота через скрипт (send_bot.sh).