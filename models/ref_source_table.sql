WITH RAW AS
(
    SELECT * FROM {{ref('raw_cust')}}
)

SELECT * FROM RAW where name= '{{var("v_name")}}'