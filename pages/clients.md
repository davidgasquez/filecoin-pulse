---
title: Clients
---

_A quick view into Filecoin Clients Metrics_

```sql clients
select
  client_id,
  client_name,
  region,
  total_deals,
  '/client/' || client_id as link,
from database.clients
order by total_deals desc
```

<DataTable
    data={clients}
    link=link
    search=true
    rows=20
/>


For clients that report location, this is the distribution of clients by region:

```sql clients_by_region
select
  region,
  count(distinct client_id) as clients
from clients
where region is not null
group by region
```

<BarChart
    data={clients_by_region}
    x=region
    y=clients
    xAxisTitle=Region
/>
