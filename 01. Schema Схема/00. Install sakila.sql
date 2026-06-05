-- =====================================================
-- ИНСТРУКЦИЯ ПО УСТАНОВКЕ БАЗЫ ДАННЫХ SAKILA
-- Sakila — тестовая БД для проката фильмов (MySQL)
-- =====================================================

/*
   СПОСОБ 1: Через официальный репозиторий GitHub
   ------------------------------------------------
   1. Откройте терминал/командную строку
   2. Выполните команды:
   
   git clone https://github.com/mysql/mysql-sakila.git
   cd mysql-sakila
   mysql -u root -p < sakila-schema.sql
   mysql -u root -p < sakila-data.sql
   
   СПОСОБ 2: Через MySQL Workbench
   --------------------------------
   1. Скачайте файлы с https://github.com/mysql/mysql-sakila
   2. Откройте MySQL Workbench
   3. File → Run SQL Script → выберите sakila-schema.sql
   4. Повторите для sakila-data.sql
   
   СПОСОБ 3: Прямая ссылка на официальный архив
   --------------------------------------------
   https://dev.mysql.com/doc/index-other.html
   (в разделе "Sakila Database")
*/

-- ПРОВЕРКА УСТАНОВКИ:
USE sakila;
SHOW TABLES;
SELECT COUNT(*) FROM customer;  -- должно быть 599
SELECT COUNT(*) FROM payment;   -- должно быть 16049
SELECT COUNT(*) FROM film;      -- должно быть 1000