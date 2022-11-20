with 

source as (
    select * from {{ source('f1championships', 'results') }}
)

select * from source