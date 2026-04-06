select 
staff_name,
store_name,
sum(total_amount_item) AS total_revenu
FROM {{ ref('int_sales__order_item_detail') }} 
group by staff_name, store_name
