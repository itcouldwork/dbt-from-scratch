WITH location_data AS (
    SELECT * 
    FROM {{ref('staging_location')}}
)
SELECT *
FROM location_data