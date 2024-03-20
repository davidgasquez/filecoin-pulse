---
title: Notaries
---

_A quick view into Filecoin Notaries Metrics_

```sql all_notaries
select
  notary_id,
  notary_name,
  notary_organization_name,
  current_allowance::bigint as current_allowance,
  verified_clients_count,
  '/notary/' || notary_id as link,
from notaries
order by current_allowance::bigint desc
```

<DataTable
  data={all_notaries}
  link=link
  search=true
  rows=30
/>
