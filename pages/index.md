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
  onboarded_data_pibs,
  data_on_active_deals_pibs,
  sum(onboarded_data_pibs) over (order by date) as cumulative_onboarded_data_pibs,
  deals,
  unique_deal_making_clients,
  unique_deal_making_providers,
  active_deals,
  clients_with_active_deals,
  providers_with_active_deals,
  raw_power_pibs,
  quality_adjusted_power_pibs,
  verified_data_power_pibs,
  network_utilization
from daily_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

## Deals

<LineChart
  data={daily_metrics}
  y=onboarded_data_pibs
  y2=cumulative_onboarded_data_pibs
  title = "Daily Onboarded Data (PiBs)"
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
  y={["unique_deal_making_clients", "unique_deal_making_providers"]}
  title = "Daily Unique Users Participating in Deals"
/>

<AreaChart
  data={daily_metrics}
  y="data_on_active_deals_pibs"
  title="Data on Active Deals (PiBs)"
/>

<LineChart
  data={daily_metrics}
  y={["clients_with_active_deals", "providers_with_active_deals"]}
  title="Users with Active Deals"
/>

## Power

<Grid cols=2>

<AreaChart
  data={daily_metrics}
  y="raw_power_pibs"
  title="Network Raw Power (PiBs)"
/>

<AreaChart
  data={daily_metrics}
  y={["quality_adjusted_power_pibs"]}
  title="Network Quality Adjusted Power (PiBs)"
/>

</Grid>

<AreaChart
  data={daily_metrics}
  y="network_utilization"
  title="Network Utilization"
/>
