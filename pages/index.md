---
title: Filecoin Pulse
---

_A quick view into Filecoin Metrics_

<DateRange
    name=range
    data={daily_metrics}
    dates=date
/>


```sql daily_metrics
select
  date,
  onboarded_data_tibs,
  sum(onboarded_data_tibs) over (order by date) as cumulative_onboarded_data_tibs,
  deals,
  unique_clients,
  unique_providers,
  active_deals,
  clients_with_active_deals,
  providers_with_active_deals
from daily_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

## Deals

<LineChart
  data={daily_metrics}
  y=onboarded_data_tibs
  y2=cumulative_onboarded_data_tibs
  title = "Daily Onboarded Data (TiBs)"
/>

<LineChart
  data={daily_metrics}
  y=deals
  y2=active_deals
  title = "Daily New Deals"
/>

## Users

<LineChart
  data={daily_metrics}
  y={["unique_clients", "unique_providers"]}
  title = "Daily Unique Users Participating in Deals"
/>

<LineChart
  data={daily_metrics}
  y={["clients_with_active_deals", "providers_with_active_deals"]}
  title="Users with Active Deals"
/>
