{{
    config(
        materialized='incremental',
        unique_key='NAME',
        on_schema_change='append_new_columns'
    )
}}

SELECT * FROM {{ref('raw_cust')}}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where INSERT_TS > (select max(INSERT_TS) from {{ this }})

{% endif %}

