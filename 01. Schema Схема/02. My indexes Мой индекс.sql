-- =====================================================
-- ДОПОЛНИТЕЛЬНЫЕ ИНДЕКСЫ ДЛЯ ОПТИМИЗАЦИИ ЗАПРОСОВ
-- (Не входят в стандартную Sakila, добавлены мной)
-- =====================================================

-- 1. Индекс для ускорения группировки по месяцам
--    Используется в запросе monthly_payments_analysis.sql
CREATE INDEX idx_payment_date ON payment(payment_date);

-- 2. Составной индекс для оконных функций
--    Ускоряет PARTITION BY customer_id ORDER BY payment_date
CREATE INDEX idx_payment_customer_date ON payment(customer_id, payment_date);

-- 3. Индекс для поиска по фамилии клиента
--    Ускоряет ORDER BY last_name, first_name
CREATE INDEX idx_customer_lastname ON customer(last_name, first_name);

-- 4. Индекс для EXISTS-подзапросов
--    Ускоряет WHERE EXISTS (SELECT 1 FROM payment WHERE amount > 10)
CREATE INDEX idx_payment_amount ON payment(amount);

/*
   ПОЧЕМУ ИМЕННО ЭТИ ИНДЕКСЫ:
   
   - Без индексов MySQL сканирует всю таблицу (full scan)
   - С индексами запрос выполняется в 10-100 раз быстрее на больших данных
   - Я сознательно не включаю их в основной скрипт, чтобы показать
     понимание оптимизации
*/