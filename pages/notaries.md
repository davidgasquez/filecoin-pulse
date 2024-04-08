---
title: Notaries
---

_A quick view into Filecoin Notaries Metrics_

```sql notaries_stats
select
  sum(current_allowance_tibs / 1024) as total_remaining_allowance_pibs,
  sum(current_allowance_tibs / 1024) filter (is_multisig) as total_remaining_allowance_pibs_multisig,
  count(distinct notary_id) filter (removed = false) as total_active_notaries,
from notaries
```
<Grid cols=3>

<BigValue
  data={notaries_stats}
  value=total_remaining_allowance_pibs
  title="Total Remaining Allowance"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  data={notaries_stats}
  value=total_remaining_allowance_pibs_multisig
  title="Total Remaining Allowance (Multisig)"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  data={notaries_stats}
  value=total_active_notaries
  title="Total Active Notaries"
/>

</Grid>

<DateRange
  name=range
  data={allocations}
  dates=date
  start=2021-01-01
/>

```sql allocations
select
  cast(time_bucket(interval '1 month', cast(height_at as date)) as string) as date,
  -- cast(height_at as date) as date,
  n.notary_organization_name as notary_organization_name,
  sum(a.allowance_tibs) as allowance_tibs
from clients_datacap_allowances as a
left join notaries as n on n.notary_id = a.notary_id
where 1=1
  and date between '${inputs.range.start}' and '${inputs.range.end}'
group by 1, 2
order by 1 asc
```

<BarChart
  data={allocations}
  x=date
  y=allowance_tibs
  series=notary_organization_name
  sort=false
/>

## Explorer

```sql all_notaries
select
  notary_id,
  left(concat(notary_organization_name, ' (', notary_name, ')'), 60) as notary,
  current_allowance_tibs,
  verified_clients_count,
  '/notary/' || notary_id as link,
from notaries
order by verified_clients_count desc
```

<DataTable
  data={all_notaries}
  link=link
  search=true
  rowShading=true
  rowLines=false
  rows=30
  downloadable=true
/>
