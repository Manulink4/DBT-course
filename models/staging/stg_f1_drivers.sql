with 

source as (
    select * from {{ source('f1championships', 'drivers') }}
)

select * from source