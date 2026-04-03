select * from {{ source('local_bike', 'categories') }}
