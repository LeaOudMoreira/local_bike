SELECT 
customer_id,
store_id,
order_date,
count(distinct order_id) AS nb_order,
sum(total_amount_item) AS revenue
FROM {{ ref('int_sales__order_item_detail') }} oid
group by customer_id,
store_id,order_date