SELECT 
s.store_id,
s.store_name,
city,
count(distinct order_id) AS total_order,
sum(total_amount_item) AS revenue
FROM {{ ref('stg_local_bike__stores') }} s
LEFT JOIN {{ ref('int_sales__order_item_detail') }} oid ON oid.store_id = s.store_id 
GROUP BY store_id, store_name, city