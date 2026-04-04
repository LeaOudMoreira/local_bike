 select * from {{ source('local_bike', 'order_items') }}
