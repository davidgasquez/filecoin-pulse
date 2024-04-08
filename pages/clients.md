---
title: Clients
---

_A quick view into Filecoin Clients Metrics_

```sql client_stats
select
  count(distinct client_id) as total_clients,
  sum(current_datacap / power(1024, 5)) as total_remaining_datacap_pibs
from clients
```

<Grid cols=4>

<BigValue
  data={client_stats}
  value=total_clients
  title="Clients"
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
  total_data_uploaded_tibs,
  '/client/' || client_id as link,
from database.clients
order by total_active_deals desc
limit 400
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
