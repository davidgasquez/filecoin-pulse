---
title: Notaries
---

_A quick view into Filecoin Notaries Metrics_

```sql allocations
select
  -- cast(time_bucket(interval '1 weeks', cast(height_at as date)) as string) as week,
  cast(height_at as date) as week,
  concat(n.notary_name, '---', n.notary_organization_name) as notary,
  sum(a.allowance_tibs) as allowance_tibs
from clients_datacap_allowances as a
left join notaries as n on n.notary_id = a.notary_id
where 1=1 and height_at > date_trunc('day', current_date) - interval '3 weeks'
group by 1, 2
order by 1 asc
```

<BarChart
    data={allocations}
    x=week
    y=allowance_tibs
    series=notary
    sort=false
/>


```sql all_notaries
select
  notary_id,
  notary_name,
  notary_organization_name,
  current_allowance::bigint as current_allowance,
  verified_clients_count,
  '/notary/' || notary_id as link,
from notaries
order by verified_clients_count desc
```

<DataTable
  data={all_notaries}
  link=link
  search=true
  rows=30
/>
