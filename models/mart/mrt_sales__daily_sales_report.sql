SELECT
order_date,
date_trunc(order_date,year) as year_order,
date_trunc(order_date,month) AS month_order,
store_name,
product_name,
sum(quantity) as quantity_order_item,
sum(total_amount_item) AS total_revenue_item
FROM {{ ref('int_sales__order_item_detail') }} oid
LEFT JOIN {{ ref('int_production__product') }} p on p.product_id = oid.product_id
group by order_date,year_order, month_order, store_name,
product_name
