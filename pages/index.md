---
title: Filecoin Pulse
---

_A view into Filecoin Metrics. Powered by the [Filecoin Data Portal](https://github.com/davidgasquez/filecoin-data-portal/)._

<DateRange
  name=range
  start=2020-09-01
/>

```sql metrics
select
  date,
  onboarded_data_pibs,
  data_on_active_deals_pibs,
  data_on_active_deals_pibs - lag(data_on_active_deals_pibs, 7) over (order by date) as data_on_active_deals_pibs_7_day_ago,
  unique_data_on_active_deals_pibs,
  unique_data_on_active_deals_pibs - lag(unique_data_on_active_deals_pibs, 7) over (order by date) as unique_data_on_active_deals_pibs_7_day_ago,
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
  new_client_ids,
  new_client_ids - lag(new_client_ids, 7) over (order by date) as new_client_ids_7_day_ago,
  new_provider_ids,
  new_provider_ids - lag(new_provider_ids, 7) over (order by date) as new_provider_ids_7_day_ago,
  raw_power_pibs,
  raw_power_pibs - lag(raw_power_pibs, 7) over (order by date) as raw_power_pibs_7_day_ago,
  quality_adjusted_power_pibs,
  quality_adjusted_power_pibs - lag(quality_adjusted_power_pibs, 7) over (order by date) as quality_adjusted_power_pibs_7_day_ago,
  verified_data_power_pibs,
  verified_data_power_pibs - lag(verified_data_power_pibs, 7) over (order by date) as verified_data_power_pibs_7_day_ago,
  network_utilization_ratio,
  network_utilization_ratio - lag(network_utilization_ratio, 7) over (order by date) as network_utilization_ratio_7_day_ago,
  active_address_count_daily,
  active_address_count_daily - lag(active_address_count_daily, 7) over (order by date) as active_address_count_daily_7_day_ago,
  total_address_count,
  total_address_count_100 as total_address_count_with_at_least_100,
  total_address_count_1000 as total_address_count_with_at_least_1000,
  total_address_count_10000 as total_address_count_with_at_least_10000,
  total_address_count_100000 as total_address_count_with_at_least_100000,
  total_address_count_1000000 as total_address_count_with_at_least_1000000
from daily_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

## Network in Numbers

<Grid cols=3>

<BigValue
  title="Data on Active Deals"
  data={metrics}
  value=data_on_active_deals_pibs
  comparison=data_on_active_deals_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Unique Data on Active Deals"
  data={metrics}
  value=unique_data_on_active_deals_pibs
  comparison=unique_data_on_active_deals_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Active Deals"
  data={metrics}
  value=active_deals
  comparison=active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Clients with Active Deals"
  data={metrics}
  value=clients_with_active_deals
  comparison=clients_with_active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Providers with Active Deals"
  data={metrics}
  value=providers_with_active_deals
  comparison=providers_with_active_deals_7_day_ago
  comparisonTitle="from last week"
/>

<BigValue
  title="Raw Power"
  data={metrics}
  value=raw_power_pibs
  comparison=raw_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Quality Adjusted Power"
  data={metrics}
  value=quality_adjusted_power_pibs
  comparison=quality_adjusted_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Verified Data Power"
  data={metrics}
  value=verified_data_power_pibs
  comparison=verified_data_power_pibs_7_day_ago
  comparisonTitle="from last week"
  fmt='#,##0 Pi\B\s'
/>

<BigValue
  title="Network Utilization"
  data={metrics}
  value=network_utilization_ratio
  comparison=network_utilization_ratio_7_day_ago
  comparisonTitle="from last week"
  fmt='00.0%'
/>

</Grid>

# Deals

<LineChart
  data={metrics}
  y=onboarded_data_pibs
  y2=cumulative_onboarded_data_pibs
  title="Daily Onboarded Data"
  connectGroup="deals"
/>

<LineChart
  data={metrics}
  y=deals
  y2=cumulative_deals
  title="Daily New Deals"
  connectGroup="deals"
/>

<Tabs>
  <Tab label="Data on Active Deals">
    <AreaChart
      data={metrics}
      y=data_on_active_deals_pibs
      y2=active_deals
    />
  </Tab>
  <Tab label="Active Deals">
    <AreaChart
      data={metrics}
      y=active_deals
    />
  </Tab>
</Tabs>

## Users

<LineChart
  data={metrics}
  y={["unique_deal_making_clients", "unique_deal_making_providers"]}
  title = "Daily Unique Users Participating in Deals"
/>

<LineChart
  data={metrics}
  y={["clients_with_active_deals", "providers_with_active_deals"]}
  title="Users with Active Deals"
/>

<BarChart
  data={metrics}
  y={["new_client_ids", "new_provider_ids"]}
  title="New Users"
/>

<LineChart
  data={metrics}
  y="active_address_count_daily"
  y2="total_address_count"
  title="Active and Total Addresses"
/>

<AreaChart
  data={metrics}
  y={["total_address_count_with_at_least_100", "total_address_count_with_at_least_1000", "total_address_count_with_at_least_10000", "total_address_count_with_at_least_100000", "total_address_count_with_at_least_1000000"]}
  title="Total Addresses by FIL Amount"
/>

## Storage Power

<Grid cols=3>

<AreaChart
  data={metrics}
  y="raw_power_pibs"
  title="Network Raw Power"
  connectGroup="power"
/>

<AreaChart
  data={metrics}
  y={["verified_data_power_pibs"]}
  title="Network Verified Data Power"
  connectGroup="power"
/>

<AreaChart
  data={metrics}
  y={["quality_adjusted_power_pibs"]}
  title="Network Quality Adjusted Power"
  connectGroup="power"
/>

</Grid>

<AreaChart
  data={metrics}
  y="network_utilization_ratio"
  title="Network Utilization"
/>

This page was last updated on <Value data = {metrics} column = date row=0 />.
