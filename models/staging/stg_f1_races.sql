with 

source as (
    select * from {{ source('f1championships', 'races') }}
)

select * from source