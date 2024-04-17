# {$page.params.provider_id}

<DateRange
  name=range
  data={filtered_provider_metrics}
  dates=date
/>


```sql filtered_provider_info
select
  *
from storage_providers
where provider_id = '${params.provider_id}'
```
<Grid cols=3>

<BigValue
  data={filtered_provider_info}
  value=provider_name
  title="Name"
/>

<BigValue
  data={filtered_provider_info}
  value=total_deals
  title="Total Deals"
/>

<BigValue
  data={filtered_provider_info}
  value=total_active_deals
  title="Total Active Deals"
/>

<BigValue
  data={filtered_provider_info}
  value=total_data_uploaded_tibs
  title="Total Onboarded Data (TiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=unique_data_uploaded_tibs
  title="Unique Onboarded Data (TiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=unique_data_uploaded_ratio
  title="Unique Onboarded Data Ratio"
  fmt='#,##0.00%'
/>

<BigValue
  data={filtered_provider_info}
  value=data_uploaded_tibs_30d
  title="Onboarded Data (TiBs) last 30d"
/>

<BigValue
  data={filtered_provider_info}
  value=data_uploaded_tibs_6m
  title="Onboarded Data (TiBs) last 6m"
/>

<BigValue
  data={filtered_provider_info}
  value=data_uploaded_tibs_1y
  title="Onboarded Data (TiBs) last 1y"
/>

<BigValue
  data={filtered_provider_info}
  value=raw_power_pibs
  title="Raw Power (PiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=quality_adjusted_power_pibs
  title="Quality Adjusted Power (PiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=verified_data_power_pibs
  title="Verified Data Power (PiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=first_deal_at
  title="First Deal"
/>

<BigValue
  data={filtered_provider_info}
  value=last_deal_at
  title="Last Deal"
/>

<BigValue
  data={filtered_provider_info}
  value=country
  title="Country"
/>

<BigValue
  data={filtered_provider_info}
  value=is_reachable
  title="Is Reachable"
/>

<BigValue
  data={filtered_provider_info}
  value=filrep_uptime_average
  title="FilRepUptime Average"
/>

<BigValue
  data={filtered_provider_info}
  value=filrep_score
  title="FilRep Score"
/>

</Grid>

## Daily Deals Metrics

```sql filtered_provider_metrics
select
  date,
  client_id,
  deals,
  onboarded_data_tibs
from deals_metrics
where 1=1
  and provider_id = '${params.provider_id}'
  and date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc, client_id asc
```

<BarChart
  data={filtered_provider_metrics}
  y=onboarded_data_tibs
  series=client_id
  title = "Onboarded Data (TiBs)"
/>

<DataTable
  data={filtered_provider_metrics}
  search=true
  rowShading=true
  rowLines=false
  rows=10
  downloadable=true
/>


## Provider Power

```sql provider_power
select
  *
from storage_providers_power
where provider_id = '${params.provider_id}'
```

<Grid cols=2>

<AreaChart
  data={provider_power}
  x=date
  y=raw_power_pibs
  title="Raw Power (PiBs)"
/>

<AreaChart
  data={provider_power}
  x=date
  y=quality_adjusted_power_pibs
  title="Quality Adjusted Power (PiBs)"
/>

</Grid>

<!-- ## Deals

```sql provider_deals
select
  *
from 'https://filecoindataportal.davidgasquez.com/data/filecoin_state_market_deals.parquet'
where provider_id = '${params.provider_id}'
order by sector_start_at
limit 10;
```


<DataTable
  data={provider_deals}
  search=true
  rowShading=true
  rowLines=false
  rows=10
  downloadable=true
/> -->

## Retrievals

```sql provider_retrievals
select
  date,
  success_rate as success_rate
from storage_providers_retrievals
where miner_id = '${params.provider_id}'
order by date desc
```

<LineChart
  data={provider_retrievals}
  x=date
  y=success_rate
  title="Retrieval Success Rate (Spark)"
/>
