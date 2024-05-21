-- komas
With stg_vadybininkai AS (
    SELECT 
        id, 
        vadybininkas
    FROM raw.vadybininkai
)

SELECT * From stg_vadybininkai