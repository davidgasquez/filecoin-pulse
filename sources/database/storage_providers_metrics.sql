select
    date,
    provider_id,
    spark_retrieval_success_rate,
    raw_power_pibs,
    quality_adjusted_power_pibs
from filecoin_daily_storage_providers_metrics
