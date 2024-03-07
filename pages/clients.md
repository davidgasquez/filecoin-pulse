---
title: Clients
---

_A quick view into Filecoin Clients Metrics_


```sql providers
select
  client_id,
  client_name,
  total_deals,
  '/client/' || client_id as link,
from clients
order by total_deals desc
limit 80
```

<DataTable
    data={providers}
    link=link
    search=true
    rows=20
/>
