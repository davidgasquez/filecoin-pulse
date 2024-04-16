# {$page.params.allocator_id}


```sql filtered_allocator_info
select
  *
from allocators
where allocator_id = '${params.allocator_id}'
```

<Grid cols=3>

<BigValue
  data={filtered_allocator_info}
  value=allocator_name
  title="Name"
/>

<BigValue
  data={filtered_allocator_info}
  value=allocator_organization_name
  title="Organization"
/>

<BigValue
  data={filtered_allocator_info}
  value=allocator_address
  title="Address"
/>

<BigValue
  data={filtered_allocator_info}
  value=initial_allowance_tibs
  title="Initial Allowance (TiBs)"
/>

<BigValue
  data={filtered_allocator_info}
  value=current_allowance_tibs
  title="Current Allowance (TiBs)"
/>

<BigValue
  data={filtered_allocator_info}
  value=is_multisig
  title="Is Multisig?"
/>

<BigValue
  data={filtered_allocator_info}
  value=created_at
  title="Created At"
/>

<BigValue
  data={filtered_allocator_info}
  value=verified_clients_count
  title="Verified Clients"
/>

<BigValue
  data={filtered_allocator_info}
  value=received_datacap_change
  title="Received Datacap Change"
/>

</Grid>

<!--
```sql datacap_balance_history
select
  updated_at::date as day,
  mean(datacap_tibs::bigint) as datacap
from allocators_datacap
where allocator_id = '${params.allocator_id}'
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
/> -->

## Datacap Allocations

```sql datacap_allowances
select
  *
from clients_datacap_allowances
where allocator_id = '${params.allocator_id}'
order by height_at desc
```

<DataTable
  data={datacap_allowances}
  emptySet=pass
  emptyMessage="No Datacap Allocations"
>
  <Column id=audit_trail contentType=link linkLabel=allowance_id title="Allowance"/>
  <Column id=height_at/>
  <Column id=client_id/>
  <Column id=message_cid/>
  <Column id=allowance_tibs/>
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
