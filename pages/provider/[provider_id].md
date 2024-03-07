# {$page.params.provider_id}

```sql filtered_provider_metrics
select
  *
from provider_metrics
where provider_id = '${params.provider_id}'
order by date desc
```

```sql filtered_provider_info
select
  *,
  onboarded_tibs / 1024 / 1024 / 1024 / 1024 as onboarded_data_tibs
from storage_providers
where provider_id = '${params.provider_id}'
```


<BigValue
  data={filtered_provider_info}
  value=total_deals
  title="Total Deals"
/>
<BigValue
  data={filtered_provider_info}
  value=total_clients
  title="Total Clients"
/>
<BigValue
  data={filtered_provider_info}
  value=country
  title="Country"
/>

<BigValue
  data={filtered_provider_info}
  value=onboarded_data_tibs
  title="Total Onboarded Data (TiBs)"
/>

## Daily Deals Metrics

<DataTable data={filtered_provider_metrics}/>

<BarChart
  data={filtered_provider_metrics}
  y=onboarded_data_tibs
  title = "Onboarded Data (TiBs)"
/>
