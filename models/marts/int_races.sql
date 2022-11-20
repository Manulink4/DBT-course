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


-- final as (
--     select * from results 
--     inner join drivers on results.driverId = drivers.driverId
--     inner join races on results.raceId = races.raceId

-- )

final as (
    select results.resultId, results.raceId, results.constructorId, results.grid, 
            results.position, results.points, results.laps, results.fastestLap, results.rank, results.time,
            results.fastestLapTime, results.fastestLapSpeed, results.statusId, drivers.forename, drivers.surname, drivers.nationality, drivers.dob, 
            races.year, races.round, races.name, races.date

    from results
    inner join drivers USING (driverId)
    inner join races USING (raceId)

)

select * from final