select 
store_name,
p.brand_name,
p.category_name,
p.product_name,
sum(total_order) as total_order,
sum(total_order_item) as total_order_item,
sum(revenue) as revenue
from {{ ref('int_sales__stores') }} s
LEFT JOIN {{ ref('int_production__product') }} p ON p.product_id = s.product_id
group by store_name,
p.brand_name,
p.category_name,
p.product_name