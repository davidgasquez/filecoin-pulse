---
title: Filecoin Pulse
---

_A quick view into Filecoin Metrics_

```sql years
select
  distinct extract(year from date) as year,
from daily_metrics
```

<Dropdown name=year data={years} value=year>
  <DropdownOption value="%" valueLabel="All"/>
</Dropdown>


```sql daily_metrics
select
  date,
  onboarded_data_tibs,
  deals,
  unique_clients,
  unique_providers
from daily_metrics
where extract(year from date) like '${inputs.year}'
order by date desc
```

<LineChart
  data={daily_metrics}
  y=onboarded_data_tibs
  title = "Daily Onboarded Data (TiBs)"
/>

<LineChart
  data={daily_metrics}
  y=deals
  title = "Daily Deals"
/>

<LineChart
  data={daily_metrics}
  y={["unique_clients", "unique_providers"]}
  title = "Daily Unique Users Participating in Deals"
/>

## Active Clients

```sql active_clients
select
  *
from historical_daily_metrics
where extract(year from day) like '${inputs.year}'
order by day desc
```

<LineChart
  data={active_clients}
  y={["active_clients", "active_providers"]}
  title="Users with Active Deals"
  labels=true
  renderer=svg
/>
