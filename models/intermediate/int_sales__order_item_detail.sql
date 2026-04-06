SELECT
oi.order_id,
o.store_id,
store.store_name,
o.staff_id,
concat(first_name," ",last_name) AS staff_name,
customer_id,
product_id,
quantity,
list_price,
discount,
(quantity*list_price)*(1-discount) AS total_amount_item
FROM {{ref('stg_local_bike__order_item')}} oi
LEFT JOIN  {{ref('stg_local_bike__orders')}} o ON oi.order_id = o.order_id
LEFT JOIN {{ ref('stg_local_bike__staffs') }} s on s.staff_id = o.staff_id
LEFT JOIN {{ ref('stg_local_bike__stores') }} store ON store.store_id = o.store_id