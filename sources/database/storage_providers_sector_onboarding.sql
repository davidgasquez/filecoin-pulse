select
    date,
    provider_id,
    daily_sector_onboarding_count,
    daily_new_sector_terminated_raw_power_tibs,
    daily_new_sector_fault_raw_power_tibs,
    daily_new_sector_recover_raw_power_tibs,
    daily_new_sector_expire_raw_power_tibs,
    daily_new_sector_extend_raw_power_tibs,
    daily_new_sector_snap_raw_power_tibs
from filecoin_daily_storage_providers_metrics
where date >= '2023-06-01'
order by date desc
