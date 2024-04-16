select
    date,
    provider_id,
    raw_power_pibs,
    quality_adjusted_power_pibs
from filecoin_storage_providers_power
where raw_power_pibs > 0
