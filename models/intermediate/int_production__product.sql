SELECT 
product_id,
product_name,
brand_name,
category_name
FROM {{ ref('stg_local_bike__products') }} p
LEFT JOIN {{ ref('stg_local_bike__brands') }} b ON b.brand_id = p.brand_id
LEFT JOIN {{ ref('stg_local_bike__categories') }} c ON c.category_id = p.category_id

