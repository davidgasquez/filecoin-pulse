# {$page.params.client_id}

```sql filtered_client
select
  *
from clients
where client_id = '${params.client_id}'
```

<BigValue
  data={filtered_client}
  value=client_name
  title="Name"
/>

<BigValue
  data={filtered_client}
  value=total_deals
  title="Total Deals"
/>

<BigValue
  data={filtered_client}
  value=current_datacap
  title="Current Datacap"
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
