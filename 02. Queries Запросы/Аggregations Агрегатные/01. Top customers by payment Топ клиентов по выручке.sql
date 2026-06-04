-- =====================================================
-- ЗАДАЧА: Выводим ТОП-10 клиентов, которые принесли больше всего выручки
-- ИСПОЛЬЗУЕМ: JOIN, SUM, GROUP BY, ORDER BY, LIMIT
-- БИЗНЕС ПРИМЕР: подготовиться к программе лояльности для лучших клиентов
-- =====================================================

/*
   ЛОГИКА ЗАПРОСА:
   1. Соединяем таблицы customer и payment через customer_id
   2. Группируем по каждому клиенту (customer_id, first_name, last_name)
   3. Суммируем amount для каждого клиента
   4. Сортируем по убыванию суммы
   5. Берём только 10 лучших
*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    SUM(p.amount) AS total_spent,
    COUNT(p.payment_id) AS number_of_payments,
    AVG(p.amount) AS avg_payment
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY total_spent DESC
LIMIT 10;