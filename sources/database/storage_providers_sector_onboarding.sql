select
    date,
    provider_id,
    daily_sector_onboarding_count,
    daily_new_terminated_raw_power_tibs,
    daily_new_fault_raw_power_tibs,
    daily_new_recover_raw_power_tibs,
    daily_new_expire_raw_power_tibs,
    daily_new_extend_raw_power_tibs,
    daily_new_snap_raw_power_tibs
from filecoin_daily_storage_providers_metrics
order by date desc
