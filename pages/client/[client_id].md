# {$page.params.client_id}

<DateRange
  name=range
  start=2020-09-01
/>

```sql filtered_client
select
  *
from clients
where client_id = '${params.client_id}'
```

<Grid cols=3>

<BigValue
  data={filtered_client}
  value=client_name
  title="Name"
/>

<BigValue
  data={filtered_client}
  value=current_datacap_tibs
  title="Current Datacap"
/>

<BigValue
  data={filtered_client}
  value=total_deals
  title="Total Deals"
/>

<BigValue
  data={filtered_client}
  value=total_active_deals
  title="Total Active Deals"
/>

<BigValue
  data={filtered_client}
  value=total_data_uploaded_tibs
  title="Total Data Uploaded (TiBs)"
/>

<BigValue
  data={filtered_client}
  value=first_deal_at
  title="First Deal"
/>

<BigValue
  data={filtered_client}
  value=last_deal_at
  title="Last Deal"
/>

<BigValue
  data={filtered_client}
  value=region
  title="Region"
/>

<BigValue
  data={filtered_client}
  value=total_active_deals
  title="Total Active Deals"
/>

<BigValue
  data={filtered_client}
  value=total_unique_providers
  title="Total Unique Providers"
/>

<BigValue
  data={filtered_client}
  value=allocator_id
/>

<BigValue
  data={filtered_client}
  value=industry
  title="Industry"
/>

</Grid>

```sql filtered_client_metrics
select
  date,
  provider_id,
  deals,
  onboarded_data_tibs
from deals_metrics
where 1=1
  and client_id = '${params.client_id}'
  and date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc, provider_id asc
```

## Daily Data Onboarding

<BarChart
  data={filtered_client_metrics}
  y=onboarded_data_tibs
  series=provider_id
  title="Onboarded Data (TiBs)"
/>

## Client Interactions with Storage Providers

```sql filtered_client_providers
with client_provider_metrics as (
select
  provider_id,
  sum(deals) as deals,
  sum(onboarded_data_tibs) as onboarded_data_tibs,
  count(distinct date) as days_with_deals,
  max(date) as last_deal_at,
  min(date) as first_deal_at
from deals_metrics
where 1=1
  and client_id = '${params.client_id}'
  and date between '${inputs.range.start}' and '${inputs.range.end}'
group by provider_id
)

select
  p.provider_id,
  p.deals,
  p.onboarded_data_tibs,
  p.days_with_deals,
  deals / sp.total_deals as client_provider_deal_share,
  onboarded_data_tibs / sp.total_data_uploaded_tibs as client_provider_data_share,
  sp.mean_spark_retrieval_success_rate_7d,
  p.first_deal_at,
  p.last_deal_at,
  sp.total_unique_clients,
  sp.raw_power_pibs,
  sp.quality_adjusted_power_pibs,
  sp.provider_name,
  sp.balance,
  sp.locked_funds,
  sp.provider_collateral,
  -- '/provider/' || p.provider_id as link,
from client_provider_metrics p
left join storage_providers sp on p.provider_id = sp.provider_id
order by onboarded_data_tibs desc
```

<DataTable
  data={filtered_client_providers}
  emptySet=pass
  emptyMessage="No Providers"
  rowShading=true
  rowLines=false
  downloadable=true
/>
