---
title: Clients
---

_A view into Filecoin Clients Metrics_

```sql client_stats
select
  count(distinct client_id) as total_clients,
  sum(current_datacap_tibs) as total_remaining_datacap_pibs,
  count(distinct client_id) filter (where total_active_deals > 0) as clients_with_active_deals,
  count(distinct client_id) filter (where total_active_deals > 0 and current_datacap_tibs > 0) as clients_with_active_deals_and_remaining_datacap,
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

<BigValue
  data={client_stats}
  value=clients_with_active_deals
  title="Clients with Active Deals"
/>

<BigValue
  data={client_stats}
  value=clients_with_active_deals_and_remaining_datacap
  title="Clients with Active Deals and Remaining Datacap"
/>

</Grid>

```sql clients_table
select
  client_id,
  client_name,
  region,
  total_active_deals as active_deals,
  data_uploaded_tibs_30d,
  data_expired_tibs_30d,
  total_active_data_uploaded_tibs as data_on_active_deals,
  allocator_id,
  '/client/' || client_id as link,
from database.clients
where 1=1
  and (data_uploaded_tibs_30d > 0 or last_deal_at > '2023-08-01' or data_expired_tibs_30d > 0)
order by data_uploaded_tibs_30d desc
```

## Explorer

<BigLink href='https://docs.google.com/spreadsheets/d/15xi39OheVJ-_WyI7sxwmvgMIVFkZN07NOYWLe5iKXnI'>
  Explore Clients on Google Sheets
</BigLink>

<DataTable
  data={clients_table}
  link=link
  search=true
  rowShading=true
  rowLines=false
  rows=30
  downloadable=true
/>
