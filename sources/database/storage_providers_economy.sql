select
    date,
    provider_id,
    balance,
    locked_funds,
    provider_collateral as collateral
from filecoin_daily_storage_providers_metrics
where (balance is not null
   or locked_funds is not null
   or provider_collateral is not null)
   and date >= '2023-06-01'
order by provider_id desc, date desc
