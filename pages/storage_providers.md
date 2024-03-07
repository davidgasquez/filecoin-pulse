---
title: Storage Providers
---

_A quick view into Filecoin Storage Providers Metrics_


## Top Providers

```sql providers
select
  provider_id,
  '/provider/' || provider_id as link,
  sum(onboarded_data_tibs) as onboarded_data_tibs
from provider_metrics
group by provider_id, link
order by 3 desc
```

<DataTable
    data={providers}
    link=link
    search=true
    rows=20
/>
