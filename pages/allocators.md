---
title: Allocators
---

_A view into Filecoin Allocators Metrics_

<DateRange
  name=range
  start=2021-01-01
/>


```sql allocators_stats
select
  sum(initial_allowance_tibs / 1024) as total_initial_allowance_pibs,
  sum(current_allowance_tibs / 1024) as total_remaining_allowance_pibs,
  sum(current_allowance_tibs / 1024) filter (is_multisig) as total_remaining_allowance_pibs_multisig,
  count(distinct allocator_id) filter (removed = false) as total_active_allocators,
  count(distinct allocator_id) filter (created_at > current_date() - interval '30 days') as new_allocators_30d,
  count(distinct allocator_id) filter (is_multisig) as total_multisig_allocators,
from allocators
where 1=1
  and created_at between '${inputs.range.start}' and '${inputs.range.end}'
```

<Grid cols=3>

<BigValue
  data={allocators_stats}
  value=total_initial_allowance_pibs
  title="Total Initial Allowance"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  data={allocators_stats}
  value=total_remaining_allowance_pibs
  title="Total Remaining Allowance"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  data={allocators_stats}
  value=total_remaining_allowance_pibs_multisig
  title="Total Remaining Allowance (Multisig)"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  data={allocators_stats}
  value=total_active_allocators
  title="Total Active Allocators"
/>

<BigValue
  data={allocators_stats}
  value=new_allocators_30d
  title="New Allocators (last 30d)"
/>

<BigValue
  data={allocators_stats}
  value=total_multisig_allocators
  title="Total Multisig Allocators"
/>

</Grid>

## Client Datacap Allocations

```sql allocations
select
  cast(time_bucket(interval '1 week', cast(height_at as date)) as string) as date,
  n.allocator_organization_name as allocator_organization_name,
  sum(a.allowance_tibs) as allowance_tibs
from clients_datacap_allowances as a
left join allocators as n on n.allocator_id = a.allocator_id
where 1=1
  and date between '${inputs.range.start}' and '${inputs.range.end}'
  and n.is_active
group by 1, 2
order by 1 asc
```

<BarChart
  data={allocations}
  x=date
  y=allowance_tibs
  series=allocator_organization_name
  sort=false
  emptySet=pass
/>

## Allocators' Datacap Allocations

```sql allocators_allowances
select
  cast(time_bucket(interval '1 week', cast(height_at as date)) as string) as date,
  sum(a.allowance_tibs / 1024) as allowance_pibs,
  sum(sum(a.allowance_tibs)) over (order by date rows between unbounded preceding and current row) / 1024 as cumulative_allowance_pibs
from allocators_datacap_allowances as a
where 1=1
  and date between '${inputs.range.start}' and '${inputs.range.end}'
group by 1
order by 1 asc
```

<Grid cols=2>

<BarChart
  data={allocators_allowances}
  x=date
  y=allowance_pibs
  sort=false
  connectGroup="ada"
  emptySet=pass
/>

<LineChart
  data={allocators_allowances}
  x=date
  y=cumulative_allowance_pibs
  sort=false
  connectGroup="ada"
  emptySet=pass
/>

</Grid>

## Explorer

```sql active_allocators
select
  allocator_id,
  left(concat(allocator_organization_name, ' (', allocator_name, ')'), 60) as allocator,
  current_allowance_tibs / 1024 as current_allowance_pibs,
  verified_clients_count,
  created_at,
  '/allocator/' || allocator_id as link,
from allocators
where 1 = 1
  and is_active
  and created_at between '${inputs.range.start}' and '${inputs.range.end}'
order by verified_clients_count desc
```

<DataTable
  data={active_allocators}
  link=link
  search=true
  rowShading=true
  rowLines=false
  rows=20
  downloadable=true
/>

## Country Distribution

```sql country_distribution
select
  location,
  count(distinct allocator_id) as allocators,
  sum(initial_allowance_tibs) as initial_allowance_tibs,
  sum(current_allowance_tibs) as current_allowance_tibs,
  sum(initial_allowance_tibs) - sum(current_allowance_tibs) as used_allowance_tibs,
  sum("12m_requested"::numeric) as requested_tibs,
from allocators
where 1 = 1
  and is_active
  and created_at between '${inputs.range.start}' and '${inputs.range.end}'
group by 1
```

<Grid cols=2>

<BarChart
  data={country_distribution}
  x=location
  y=allocators
  connectGroup=country
  labels=true
  title="Allocators by Country"
/>

<BarChart
  data={country_distribution}
  x=location
  y=current_allowance_tibs
  connectGroup=country
  labels=true
  title="Current Allowance by Country"
/>

<BarChart
  data={country_distribution}
  x=location
  y=requested_tibs
  connectGroup=country
  labels=true
  title="Requested Data by Country"
/>

<BarChart
  data={country_distribution}
  x=location
  y=used_allowance_tibs
  connectGroup=country
  labels=true
  title="Used Allowance by Country"
/>

</Grid>
