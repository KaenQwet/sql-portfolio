-- =====================================================
-- ЗАДАЧА: Присвоить каждому клиенту ранг в зависимости от суммы трат
-- ИСПОЛЬЗУЕМ: SUM, RANK() OVER, DENSE_RANK()
-- БИЗНЕС ПРИМЕР: Подготовка к созданию уровней лояльности
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
   - RANK()      : 1,2,2,4,... (пропускает следующий номер при равенстве)
   - DENSE_RANK(): 1,2,2,3,... (не пропускает номера)
   - SUM() OVER(): сумма ВСЕХ total_spent (для расчёта процента)
*/


WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS ranking,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS dense_ranking,
    ROUND(100 * total_spent / SUM(total_spent) OVER (), 2) AS percentage_of_total
FROM customer_spending
ORDER BY ranking
LIMIT 10;
