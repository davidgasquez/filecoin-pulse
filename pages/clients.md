---
title: Clients
---

_A view into Filecoin Clients Metrics_

```sql client_stats
select
  count(distinct client_id) as total_clients,
  sum(current_datacap_tibs) as total_remaining_datacap_pibs
from clients
```

<Grid cols=2>

<BigValue
  data={client_stats}
  value=total_clients
  title="Filecoin Clients"
/>

<BigValue
  data={client_stats}
  value=total_remaining_datacap_pibs
  title="Total Remaining Datacap"
  fmt='#,##0 \P\i\B\s'
/>

</Grid>

```sql clients_table
select
  client_id,
  client_name,
  region,
  total_active_deals,
  data_uploaded_tibs_30d,
  total_active_data_uploaded_tibs,
  '/client/' || client_id as link,
from database.clients
where 1=1
  and (data_uploaded_tibs_30d > 0 or last_deal_at > '2023-01-01')
order by data_uploaded_tibs_30d desc
```

## Explorer

<DataTable
  data={clients_table}
  link=link
  search=true
  rowShading=true
  rowLines=false
  rows=30
  downloadable=true
/>
