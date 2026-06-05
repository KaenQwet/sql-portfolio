# Схема базы данных Sakila

## Что такое Sakila?

**Sakila** — официальная тестовая база данных MySQL, моделирующая работу видеопроката.  
Создана компанией MySQL для демонстрации возможностей и обучения.

## Как установить

### Быстрая установка (Linux/Mac/Windows с Git)

```bash
git clone https://github.com/mysql/mysql-sakila.git
cd mysql-sakila
mysql -u root -p < sakila-schema.sql
mysql -u root -p < sakila-data.sql

Проверка установки
USE sakila;
SELECT COUNT(*) FROM customer;  -- 599
SELECT COUNT(*) FROM payment;   -- 16049
SELECT COUNT(*) FROM film;      -- 1000
