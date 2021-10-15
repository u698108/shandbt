with raw AS
(
    SELECT * FROM {{source('test','cust')}}
)

SELECT   raw.*
from raw left join {{source('test','incre')}} AS INCR
on
raw.name=incr.name