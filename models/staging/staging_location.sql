WITH locations_data AS (
    SELECT DISTINCT
		   --(extracted_data ->> 'q')  AS location,
           (extracted_data->'location'->>'name')::VARCHAR(255) AS city
           ,(extracted_data-> 'location'->>'region')::VARCHAR(255) AS region
           ,(extracted_data -> 'location'->> 'country')::VARCHAR(255) AS country
           ,(extracted_data -> 'location' ->> 'lat')::NUMERIC AS lat 
           ,(extracted_data -> 'location' ->> 'lon')::NUMERIC AS lon
           ,(extracted_data -> 'location' ->> 'tz_id') AS timezone_id
        --   ,TO_TIMESTAMP((extracted_data -> 'location' ->> 'localtime_epoch')::BIGINT) AS time_epoch
--           ,(extracted_data -> 'location' ->> 'localtime')::TIMESTAMP AS time_local
    FROM {{source("staging", "weather_raw")}})
SELECT * 
FROM locations_data