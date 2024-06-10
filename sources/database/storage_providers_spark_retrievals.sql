select
    date,
    provider_id,
    spark_retrieval_success_rate,
from filecoin_daily_storage_providers_metrics
where spark_retrieval_success_rate is not null
order by date desc, spark_retrieval_success_rate desc
