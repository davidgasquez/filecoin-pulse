---
title: Storage Providers
---

_A quick view into Filecoin Storage Providers Metrics_


## Top Providers

```sql providers
select
  '/provider/' || provider_id as link,
  provider_id,
  total_deals,
  total_data_uploaded_tibs,
  score,
  country,
  uptime_average,
  is_reachable
from storage_providers
order by total_data_uploaded_tibs desc
limit 1000
```

<DataTable
  data={providers}
  link=link
  search=true
  rows=20
/>
