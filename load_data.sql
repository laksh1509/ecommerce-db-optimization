-- 100,000 customers
INSERT INTO customers (first_name, last_name, age, email, created_at)
SELECT 'First' || g,
       'Last' || g,
       18 + floor(random() * 50)::int,
       'user' || g || '@example.com',
       now() - make_interval(days => (random() * 730)::int)
FROM generate_series(1, 100000) AS g;

-- 1,000 products
INSERT INTO products (item, price)
SELECT 'Product ' || g,
       round((5 + random() * 495)::numeric, 2)
FROM generate_series(1, 1000) AS g;

-- 1,000,000 orders
INSERT INTO orders (customer_id, order_date, status)
SELECT 1 + floor(random() * 100000)::int,
       DATE '2024-01-01' + (random() * 700)::int,
       (ARRAY['placed', 'shipped', 'delivered', 'cancelled'])[1 + floor(random() * 4)::int]
FROM generate_series(1, 1000000);

-- 1 to 3 distinct products per order
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT o.order_id,
       p.product_id,
       1 + floor(random() * 5)::int,
       p.price
FROM (
    SELECT order_id,
           1 + floor(random() * 3)::int AS n,
           floor(random() * 1000)::int  AS base
    FROM orders
) o
CROSS JOIN LATERAL generate_series(0, o.n - 1) AS k
JOIN products p ON p.product_id = ((o.base + k * 337) % 1000) + 1;