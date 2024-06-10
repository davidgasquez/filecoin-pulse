---
title: Monthly Metrics
sidebar_link: false
---

_Filecoin Monthly Metrics. Powered by the [Filecoin Data Portal](https://github.com/davidgasquez/filecoin-data-portal/)._

<DateRange
  name=range
  start=2023-05-01
/>

```sql metrics
select
  date,
  onboarded_data_pibs,
  unique_data_onboarded_data_pibs,
  unique_data_onboarded_ratio,
  deals,
  piece_cids,
  unique_piece_cids,
  unique_deal_making_clients,
  unique_deal_making_providers,
  sector_onboarding_count,
  sector_onboarding_raw_power_pibs,
  sector_onboarding_quality_adjusted_power_pibs,
  sector_terminated_raw_power_pibs,
  sector_terminated_quality_adjusted_power_pibs,
  new_providers_providing_capacity,
from monthly_metrics
where date between '${inputs.range.start}' and '${inputs.range.end}'
order by date desc
```

<BarChart
  data={metrics}
  x="date"
  y="onboarded_data_pibs"
  xAxisTitle="Month"
  yFmt="#0.00 Pi\B\s"
  title="Onboarded Data"
  colorPalette={['#0e79fe']}
/>

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
