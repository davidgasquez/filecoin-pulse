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

<DataTable
  data={filtered_client_metrics}
/>

## Daily Deals Metrics

<BarChart
  data={filtered_client_metrics}
  y=onboarded_data_tibs
  series=provider_id
  title="Onboarded Data (TiBs)"
/>
