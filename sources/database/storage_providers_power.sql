select
    date,
    provider_id,
    raw_power_pibs,
    quality_adjusted_power_pibs
from filecoin_daily_storage_providers_metrics
where quality_adjusted_power_pibs > 0
order by date desc, quality_adjusted_power_pibs desc
