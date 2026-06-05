-- =====================================================
-- ЗАДАЧА: Найти клиентов, у которых есть платежи больше 10$
-- ИСПОЛЬЗУЕМ: EXISTS 
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
	- EXISTS останавливается на ПЕРВОМ найденном совпадении
   - IN собирает ВСЕ совпадения, потом сравнивает
   - EXISTS работает быстрее на больших данных
   
   "SELECT 1" — значение не важно, важно только ЕСТЬ/НЕТ
*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM payment p
    WHERE p.customer_id = c.customer_id
      AND p.amount > 10
)
ORDER BY c.customer_id
LIMIT 20;