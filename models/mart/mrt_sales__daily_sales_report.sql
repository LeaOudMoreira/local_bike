SELECT
order_date,
year(order_date) as year_order,
month(order_date) AS month_order,
store_name,
product_name,
sum(quantity) as quantity_order_item,
sum(total_amount_item) AS total_revenue_item
FROM {{ ref('int_sales__order_item_detail') }}
group by order_date,year_order, month_order, store_name,
product_name
