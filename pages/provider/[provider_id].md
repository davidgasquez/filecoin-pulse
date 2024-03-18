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
  value=total_data_uploaded_tibs
  title="Total Onboarded Data (TiBs)"
/>

<BigValue
  data={filtered_provider_info}
  value=data_uploaded_tibs_30d
  title="Onboarded Data (TiBs) last 30d"
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
  value=uptime_average
  title="Uptime Average"
/>

<BigValue
  data={filtered_provider_info}
  value=score
  title="FilRep Score"
/>

## Daily Deals Metrics

```sql filtered_provider_metrics
select
  date,
  client_id,
  deals,
  onboarded_data_tibs
from interaction_metrics
where 1=1
  and provider_id = '${params.provider_id}'
  and date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc, client_id asc
```

<DataTable data={filtered_provider_metrics}/>

<BarChart
  data={filtered_provider_metrics}
  y=onboarded_data_tibs
  series=client_id
  title = "Onboarded Data (TiBs)"
/>
