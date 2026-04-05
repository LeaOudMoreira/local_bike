SELECT
oi.order_id,
o.store_id,
staff_id,
customer_id,
product_id,
quantity,
list_price,
discount,
(quantity*list_price)*(1-discount) AS total_amount_item
FROM {{ref('stg_local_bike__order_item')}} oi
LEFT JOIN  {{ref('stg_local_bike__orders')}} o ON oi.order_id = o.order_id




