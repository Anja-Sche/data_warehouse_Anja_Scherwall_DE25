with src_employer as (select * from {{ ref('src_employer')}} )

select
    {{ dbt_utils.generate_surrogate_key(['employer__workplace', 'workplace_address__municipality']) }} as employer_id,
    employer_name,
    employer_workspace,
    employer_orgenization_number,
    workplace_street_address,
    workplace_region,
    worlpace_postcode,
    workplace_city,
    workplace_country
from src_employer
group by 