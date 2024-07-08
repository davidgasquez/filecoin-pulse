---
title: Monthly Metrics
sidebar_position: 5
---

_Filecoin Monthly Metrics. Powered by the [Filecoin Data Portal](https://github.com/davidgasquez/filecoin-data-portal/)._

<DateRange
  name=range
  start=2023-01-01
/>

```sql metrics
select
  date,
  onboarded_data_pibs,
  unique_data_onboarded_data_pibs,
  unique_data_onboarded_ratio,
  deals,
  unique_deal_making_clients,
  unique_deal_making_providers,
  data_on_active_deals_pibs,
  clients_with_active_deals,
  providers_with_active_deals,
  raw_power_pibs,
  quality_adjusted_power_pibs,
  verified_data_power_pibs,
  sector_onboarding_count,
  sector_onboarding_raw_power_pibs,
  sector_onboarding_quality_adjusted_power_pibs,
  sector_terminated_raw_power_pibs,
  sector_terminated_quality_adjusted_power_pibs,
  new_providers_providing_capacity,
  new_client_ids,
  new_provider_ids,
  active_address_count_monthly,
  new_providers_providing_capacity
from monthly_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

## Data Onboarding

<BarChart
  data={metrics}
  x="date"
  y="onboarded_data_pibs"
  xAxisTitle="Month"
  yFmt="#0.00 Pi\B\s"
  title="Onboarded Data"
  colorPalette={['#0e79fe']}
/>


## Network Users

<Grid cols=2>

<BarChart
  data={metrics}
  x="date"
  y="unique_deal_making_clients"
  xAxisTitle="Month"
  title="Unique Deal Making Clients"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

<BarChart
  data={metrics}
  x="date"
  y="unique_deal_making_providers"
  xAxisTitle="Month"
  title="Unique Deal Making Providers"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

<BarChart
  data={metrics}
  x="date"
  y="clients_with_active_deals"
  xAxisTitle="Month"
  title="Clients With Active Deals"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

<BarChart
  data={metrics}
  x="date"
  y="providers_with_active_deals"
  xAxisTitle="Month"
  title="Providers With Active Deals"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

<BarChart
  data={metrics}
  x="date"
  y="active_address_count_monthly"
  xAxisTitle="Month"
  title="Active Address Count Monthly"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

<BarChart
  data={metrics}
  x="date"
  y={["new_provider_ids", "new_client_ids"]}
  xAxisTitle="Month"
  title="New Provider and Client IDs"
  colorPalette={['#0e79fe']}
  connectGroup="users"
/>

</Grid>

## Power

<Grid cols=3>

<AreaChart
  data={metrics}
  x="date"
  y="raw_power_pibs"
  xAxisTitle="Month"
  title="Raw Power"
  colorPalette={['#0e79fe']}
  connectGroup="power"
/>

<AreaChart
  data={metrics}
  x="date"
  y="quality_adjusted_power_pibs"
  xAxisTitle="Month"
  title="Quality Adjusted Power"
  colorPalette={['#0e79fe']}
  connectGroup="power"
/>

<AreaChart
  data={metrics}
  x="date"
  y="verified_data_power_pibs"
  xAxisTitle="Month"
  title="Verified Data Power"
  colorPalette={['#0e79fe']}
  connectGroup="power"
/>

</Grid>

## Sectors Onboarding

<Grid cols=2>

<BarChart
  data={metrics}
  x="date"
  y="sector_onboarding_count"
  xAxisTitle="Month"
  title="Sector Onboarding Count"
  colorPalette={['#0e79fe']}
  connectGroup="sectors"
/>

<BarChart
  data={metrics}
  x="date"
  y="new_providers_providing_capacity"
  xAxisTitle="Month"
  title="New Providers Providing Capacity"
  colorPalette={['#0e79fe']}
  connectGroup="sectors"
/>

<BarChart
  data={metrics}
  x="date"
  y="sector_terminated_raw_power_pibs"
  yFmt="#0.00 Pi\B\s"
  xAxisTitle="Month"
  title="Sector Terminated Raw Power"
  colorPalette={['#0e79fe']}
  connectGroup="sectors"
/>

<BarChart
  data={metrics}
  x="date"
  y="sector_terminated_quality_adjusted_power_pibs"
  yFmt="#0.00 Pi\B\s"
  xAxisTitle="Month"
  title="Sector Terminated Quality Adjusted Power"
  colorPalette={['#0e79fe']}
  connectGroup="sectors"
/>

</Grid>
