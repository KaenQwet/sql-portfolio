-- =====================================================
-- ЗАДАЧА: Отсортировать клиентов, платежи которых больше 30 
-- ИСПОЛЬЗУЕМ: JOIN, COUNT, GROUP BY, HAVING
-- БИЗНЕС ПРИМЕР: поиск самых активных клиентов
-- =====================================================

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(p.payment_id) AS payments_count
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(p.payment_id) > 30
ORDER BY payments_count DESC;