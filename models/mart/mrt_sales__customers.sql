SELECT 
customer_id,
store_id,
count(distinct order_id) AS nb_order,
sum(total_amount_item) AS revenue
FROM {{ ref('int_sales__order_item_detail') }}