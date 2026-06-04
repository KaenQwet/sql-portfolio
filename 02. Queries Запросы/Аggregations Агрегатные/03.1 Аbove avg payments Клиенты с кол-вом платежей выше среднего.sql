-- =====================================================
-- ЗАДАЧА: Отсортировать клиентов, у которых количество платежей больше среднего
-- ИСПОЛЬЗУЕМ: подзапрос, HAVING, AVG
-- БИЗНЕС ПРИМЕР: поиск лояльных клиентов (которые часто тратят деньги)
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
   1. Считает количество платежей для КАЖДОГО клиента
   2. Вычисляем СРЕДНЕЕ от этих количеств
   3. Сравниваем платежи каждого клиента с этим средним
*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(p.payment_id) AS payments_count
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING COUNT(p.payment_id) > (
    SELECT AVG(payments_count)
    FROM (
        SELECT COUNT(*) AS payments_count
        FROM payment
        GROUP BY customer_id
    ) AS avg_table
)
ORDER BY payments_count DESC;