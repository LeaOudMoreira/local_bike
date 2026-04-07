select 
staff_name,
s.store_name,
order_date,
sum(total_amount_item) AS total_revenu
FROM {{ ref('int_sales__order_item_detail') }} oid
LEFT JOIN {{ ref('int_sales__stores') }} s ON s.store_id = oid.store_id
group by staff_name, store_name,order_date
