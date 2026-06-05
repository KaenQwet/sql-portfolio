-- =====================================================
-- ОСНОВНЫЕ ТАБЛИЦЫ SAKILA, ИСПОЛЬЗУЕМЫЕ В ПОРТФОЛИО
-- =====================================================

/*
   customer (клиенты)
   -----------------
   customer_id - ID клиента (первичный ключ)
   first_name  - имя
   last_name   - фамилия
   email       - электронная почта
   active      - статус (1 - активен, 0 - неактивен)
   address_id  - связь с адресом
   create_date - дата регистрации
   
   payment (платежи)
   -----------------
   payment_id   - ID платежа (первичный ключ)
   customer_id  - ID клиента (внешний ключ → customer)
   amount       - сумма платежа
   payment_date - дата платежа
   
   rental (аренда фильмов)
   -----------------------
   rental_id    - ID аренды (первичный ключ)
   rental_date  - дата начала аренды
   inventory_id - ID копии фильма (внешний ключ → inventory)
   customer_id  - ID клиента (внешний ключ → customer)
   return_date  - дата возврата
   
   film (фильмы)
   -------------
   film_id      - ID фильма (первичный ключ)
   title        - название
   rental_rate  - стоимость проката
   rating       - рейтинг (PG, R, G и т.д.)
   
   inventory (копии фильмов)
   -------------------------
   inventory_id - ID копии (первичный ключ)
   film_id      - ID фильма (внешний ключ → film)
   store_id     - ID магазина
*/

-- КЛЮЧЕВЫЕ СВЯЗИ (для понимания JOIN):
/*
   customer → payment   : customer.customer_id = payment.customer_id
   customer → rental    : customer.customer_id = rental.customer_id
   rental → inventory   : rental.inventory_id = inventory.inventory_id
   inventory → film     : inventory.film_id = film.film_id
*/