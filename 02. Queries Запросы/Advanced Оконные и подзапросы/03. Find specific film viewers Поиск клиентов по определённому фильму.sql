-- =====================================================
-- ЗАДАЧА: Найти всех клиентов, которые брали конкретный фильм
-- ИСПОЛЬЗУЕМ: многотабличный JOIN, подзапрос, IN
-- БИЗНЕС ПРИМЕР: Создем маркетинговую акцию для зрителей популярного фильма
-- =====================================================

-- Решение 1: через JOIN
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

-- Решение 2: через подзапрос (альтернативный подход)
SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT r.customer_id
    FROM rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    WHERE f.title = 'ACADEMY DINOSAUR'
);