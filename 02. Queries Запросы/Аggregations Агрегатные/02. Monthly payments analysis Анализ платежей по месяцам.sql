-- =====================================================
-- ЗАДАЧА: Проанализировать платежи по месяцам
-- ИСПОЛЬЗУЕМ: DATE_FORMAT, GROUP BY, SUM, COUNT, AVG
-- БИЗНЕС ПРИМЕР: подготовка отчёта для финансового отдела
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
   1. Извлекаем год и месяц из payment_date
   2. Группируем по году и месяцу
   3. Считаем количество платежей, общую сумму и средний чек
   4. Сортируем по хронологии
*/

SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    COUNT(*) AS payments_count,
    SUM(amount) AS total_amount,
    ROUND(AVG(amount), 2) AS avg_amount,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount
FROM payment
GROUP BY month
ORDER BY month;