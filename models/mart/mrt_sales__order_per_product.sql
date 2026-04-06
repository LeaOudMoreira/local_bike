SELECT 
brand_name,
category_name,
product_name,
sum(total_amount_item) AS total_revenue,
sum(quantity) AS total_ordered_item
FROM {{ ref('int_sales__order_item_detail') }} oid
LEFT JOIN {{ ref('int_production__product') }} p ON p.product_id = oid.product_id 
group by brand_name,
category_name,
product_name