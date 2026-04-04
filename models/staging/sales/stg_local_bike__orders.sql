 
select * from {{ source('local_bike', 'orders') }}
