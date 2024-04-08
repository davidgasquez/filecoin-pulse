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
  data_on_active_deals_pibs - lag(data_on_active_deals_pibs, 7) over (order by date) as data_on_active_deals_pibs_7_day_ago,
  sum(onboarded_data_pibs) over (order by date) as cumulative_onboarded_data_pibs,
  deals,
  sum(deals) over (order by date) as cumulative_deals,
  unique_deal_making_clients,
  unique_deal_making_providers,
  active_deals,
  active_deals - lag(active_deals, 7) over (order by date) as active_deals_7_day_ago,
  clients_with_active_deals,
  clients_with_active_deals - lag(clients_with_active_deals, 7) over (order by date) as clients_with_active_deals_7_day_ago,
  providers_with_active_deals,
  providers_with_active_deals - lag(providers_with_active_deals, 7) over (order by date) as providers_with_active_deals_7_day_ago,
  raw_power_pibs,
  raw_power_pibs - lag(raw_power_pibs, 7) over (order by date) as raw_power_pibs_7_day_ago,
  quality_adjusted_power_pibs,
  quality_adjusted_power_pibs - lag(quality_adjusted_power_pibs, 7) over (order by date) as quality_adjusted_power_pibs_7_day_ago,
  verified_data_power_pibs,
  verified_data_power_pibs - lag(verified_data_power_pibs, 7) over (order by date) as verified_data_power_pibs_7_day_ago,
  network_utilization_percentage,
  network_utilization_percentage - lag(network_utilization_percentage, 7) over (order by date) as network_utilization_percentage_7_day_ago
from daily_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

## Network in Numbers

<Grid cols=4>

<BigValue
  title="Data on Active Deals"
  data={daily_metrics}
  value=data_on_active_deals_pibs
  comparison=data_on_active_deals_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Active Deals"
  data={daily_metrics}
  value=active_deals
  comparison=active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Clients with Active Deals"
  data={daily_metrics}
  value=clients_with_active_deals
  comparison=clients_with_active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Providers with Active Deals"
  data={daily_metrics}
  value=providers_with_active_deals
  comparison=providers_with_active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Raw Power"
  data={daily_metrics}
  value=raw_power_pibs
  comparison=raw_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Quality Adjusted Power"
  data={daily_metrics}
  value=quality_adjusted_power_pibs
  comparison=quality_adjusted_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Verified Data Power"
  data={daily_metrics}
  value=verified_data_power_pibs
  comparison=verified_data_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Network Utilization"
  data={daily_metrics}
  value=network_utilization_percentage
  comparison=network_utilization_percentage_7_day_ago
  comparisonTitle="from last week"
/>

</Grid>

# Deals

<LineChart
  data={daily_metrics}
  y=onboarded_data_pibs
  y2=cumulative_onboarded_data_pibs
  title="Daily Onboarded Data"
  connectGroup="deals"
/>

<LineChart
  data={daily_metrics}
  y=deals
  y2=cumulative_deals
  title="Daily New Deals"
  connectGroup="deals"
/>

<Tabs>
  <Tab label="Data on Active Deals">
    <AreaChart
      data={daily_metrics}
      y=data_on_active_deals_pibs
      y2=active_deals
    />
  </Tab>
  <Tab label="Active Deals">
    <AreaChart
      data={daily_metrics}
      y=active_deals
    />
  </Tab>
</Tabs>



## Users

<LineChart
  data={daily_metrics}
  y={["unique_deal_making_clients", "unique_deal_making_providers"]}
  title = "Daily Unique Users Participating in Deals"
/>

<LineChart
  data={daily_metrics}
  y={["clients_with_active_deals", "providers_with_active_deals"]}
  title="Users with Active Deals"
/>

## Storage Power

<Grid cols=3>

<AreaChart
  data={daily_metrics}
  y="raw_power_pibs"
  title="Network Raw Power"
  connectGroup="power"
/>

<AreaChart
  data={daily_metrics}
  y={["verified_data_power_pibs"]}
  title="Network Verified Data Power"
  connectGroup="power"
/>

<AreaChart
  data={daily_metrics}
  y={["quality_adjusted_power_pibs"]}
  title="Network Quality Adjusted Power"
  connectGroup="power"
/>


</Grid>

<AreaChart
  data={daily_metrics}
  y="network_utilization_percentage"
  title="Network Utilization"
/>

This page was last updated on <Value data = {daily_metrics} column = date row=0 />.
