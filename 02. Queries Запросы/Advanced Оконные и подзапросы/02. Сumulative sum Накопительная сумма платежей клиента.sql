-- =====================================================
-- ЗАДАЧА: Показать как росла сумма платежей каждого клиента
-- ИСПОЛЬЗУЕМ: PARTITION BY, SUM() OVER (ORDER BY)
-- БИЗНЕС ПРИМЕР: анализируем динамику трат клиента
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
    PARTITION BY c.customer_id  → отдельный расчёт для каждого клиента
   ORDER BY p.payment_date     → сумма накапливается в хронологическом порядке
*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_date,
    p.amount,
    SUM(p.amount) OVER (
        PARTITION BY c.customer_id 
        ORDER BY p.payment_date
    ) AS cumulative_sum
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id, p.payment_date
LIMIT 20;

