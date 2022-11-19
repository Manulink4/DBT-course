with 

users as (
    select * from {{ ref('int_users') }}
),

users_event_features as (
    select * from {{ ref('extra_users_features') }}
)

select
    *
from users
left join users_event_features using (user_id)