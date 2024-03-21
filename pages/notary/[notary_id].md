# {$page.params.notary_id}


```sql filtered_notary_info
select
  *
from notaries
where notary_id = '${params.notary_id}'
```

<BigValue
  data={filtered_notary_info}
  value=notary_name
  title="Name"
/>

<BigValue
  data={filtered_notary_info}
  value=notary_organization_name
  title="Organization"
/>

<BigValue
  data={filtered_notary_info}
  value=initial_allowance
  title="Initial Allowance"
/>

<BigValue
  data={filtered_notary_info}
  value=current_allowance
  title="Current Allowance"
/>

<BigValue
  data={filtered_notary_info}
  value=is_multisig
  title="Is Multisig?"
/>

<BigValue
  data={filtered_notary_info}
  value=verified_clients_count
  title="Verified Clients"
/>

```sql datacap_balance_history
select
  updated_at::date as day,
  mean(datacap_tibs::bigint) as datacap
from notaries_datacap
where notary_id = '${params.notary_id}'
group by updated_at
order by updated_at desc
```

## Datacap Changes

<AreaChart
  data={datacap_balance_history}
  x=day
  y=datacap
  step=true
  emptySet=pass
/>

## Datacap Allocations

```sql datacap_allowances
select
  *
from clients_datacap_allowances
where notary_id = '${params.notary_id}' and is_valid
```

<DataTable
  data={datacap_allowances}
  emptySet=pass
  emptyMessage="No Datacap Allocations"
>
  <Column id=height_at/>
  <Column id=client_id/>
  <Column id=message_cid/>
  <Column id=allowance_tibs/>
  <Column id=audit_trail/>
  <Column id=is_data_public/>
  <Column id=is_from_autoverifier/>
</DataTable>


<Histogram
  data={datacap_allowances}
  x=allowance_tibs
  xAxisTitle="Datacap Allocation Size"
  emptySet=pass
  title="Datacap Allocation Size Distribution"
  emptyMessage="No Datacap Allocations"
/>
