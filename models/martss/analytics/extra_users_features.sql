with 

users as (
    select user_id, registered_at from {{ ref('int_users') }}
),

events as (
    select * from {{ ref('int_events') }}
)

select
    users.user_id,
    count(events.event_id) as num_events,
    count(distinct events.page) as num_unique_events,
    max(city) as city,
    max(state) as state,
    array_agg(events.level ORDER BY created_at desc limit 1)[offset(0)] = 'paid' as is_paying,
    max(timestamp_diff(current_timestamp(), registered_at, day)) as days_since_registration,


from users
left join events using (user_id)
group by 1
order by 1