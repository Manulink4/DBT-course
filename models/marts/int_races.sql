
with 

results as (
    select * from {{ ref('stg_f1_results') }}
),

drivers as (
    select * from {{ ref('stg_f1_drivers') }}
),

races as (
    select * from {{ ref('stg_f1_races') }}
),

-- artists_normalized as (
--     select
--         artist_id,
--         max(artist_mbid) as artist_mbid,
--         max(artist_name) as name,
--         max(artist_familiarity) as familiarity,
--         max(artist_hotttnesss) as hotness,
--         count(*) as num_songs
--     from songs_artists
--     group by 1
-- )

final as (
    select * from results
        inner join drivers on results.driverId = drivers.driverId
        inner join races on results.raceId = races.raceId

)


select * from final