---
title: Storage Providers
---

_A quick view into Filecoin Storage Providers Metrics_

## Top Providers

```sql providers
select
  '/provider/' || provider_id as link,
  provider_id,
  total_active_deals,
  total_data_uploaded_tibs,
  total_active_data_uploaded_tibs,
  total_unique_clients,
  first_deal_at,
  last_deal_at,
  country,
  provider_name
from storage_providers
where 1 = 1
  and (last_deal_at > '2023-01-01' or data_uploaded_tibs_30d > 0 or provider_name is not null)
order by total_active_data_uploaded_tibs desc
```

<DataTable
  data={providers}
  link=link
  search=true
  rows=30
/>
