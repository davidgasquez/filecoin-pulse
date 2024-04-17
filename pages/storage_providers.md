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
  total_active_deals,
  total_data_uploaded_tibs,
  total_active_data_uploaded_tibs,
  total_unique_clients,
  first_deal_at,
  last_deal_at,
  country,
from storage_providers
order by total_active_data_uploaded_tibs desc
limit 500
```

<DataTable
  data={providers}
  link=link
  search=true
  rows=30
/>
