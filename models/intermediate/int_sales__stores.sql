WITH order_item_detail_concat AS (
    SELECT concat(store_id,product_id) AS store_product_id,
    order_id,
    quantity AS order_item_amount,
    total_amount_item
    FROM {{ ref('int_sales__order_item_detail') }}

),

stock_concat AS (
SELECT 
concat(store_id,product_id) AS store_product_id,
store_id,
product_id,
quantity
FROM {{ ref('stg_local_bike__stocks') }}
)

SELECT 
stk.store_id,
s.store_name,
stk.product_id,
stk.quantity AS stock,
count(distinct order_id) AS total_order,
sum(order_item_amount) AS total_order_item,
sum(total_amount_item) AS revenue
FROM stock_concat stk 
LEFT JOIN order_item_detail_concat oid ON oid.store_product_id = stk.store_product_id 
LEFT JOIN {{ ref('stg_local_bike__stores') }} s ON stk.store_id = s.store_id
GROUP BY store_id, store_name, product_id,stock