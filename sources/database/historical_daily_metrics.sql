with date_series as (
  select
    cast(range as date) as day
  from range(date '2022-09-12', date '2024-03-05', interval 1 day)
),

active_deals as (
  select
    ds.day,
    count(distinct d.client_id) as active_clients,
    count(distinct d.provider_id) as active_providers
  from date_series ds
  left join filecoin_state_market_deals d on ds.day between d.sector_start_at and least(d.end_at, d.slash_at)
  group by ds.day
)

select * from active_deals
