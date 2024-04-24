# {$page.params.allocator_id}

```sql filtered_allocator_info
select
  *
from allocators
where allocator_id = '${params.allocator_id}'
```

<Grid cols=4>

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
  value=is_multisig
  title="Is Multisig?"
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

<BigValue
  data={filtered_allocator_info}
  value=location
/>

<BigValue
  data={filtered_allocator_info}
  value=metapathway_type
/>

<BigValue
  data={filtered_allocator_info}
  value=associated_org_addresses
/>

<BigValue
  data={filtered_allocator_info}
  value=standardized
/>

<BigValue
  data={filtered_allocator_info}
  value=target_clients
/>

<BigValue
  data={filtered_allocator_info}
  value=required_sps
/>

<BigValue
  data={filtered_allocator_info}
  value=required_replicas
/>

<BigValue
  data={filtered_allocator_info}
  value=data_types
/>

<BigValue
  data={filtered_allocator_info}
  value=12m_requested
/>

<BigValue
  data={filtered_allocator_info}
  value=github_handles
/>

<!-- TODO: Add POC and Pathway-->
<!-- TODO: Figure out a way to link back to the application -->

</Grid>


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
/>

## Datacap Allocations

```sql datacap_allowances
select
  *,
  split_part(split_part(audit_trail, '/', -1), '/', 1) as allowance_number
from clients_datacap_allowances
where allocator_id = '${params.allocator_id}'
order by height_at desc
```

<DataTable
  data={datacap_allowances}
  emptySet=pass
  emptyMessage="No Datacap Allocations"
>
  <Column id=audit_trail contentType=link linkLabel=allowance_number title="Allowance GitHub Number"/>
  <Column id=client_id/>
  <Column id=allowance_tibs/>
  <Column id=height_at title="Timestamp"/>
  <Column id=is_data_public/>
  <Column id=is_from_autoverifier/>
  <Column id=message_cid/>
</DataTable>


### Client Details

```sql allowances_client_details
select
  *,
  '/client/' || client_id as link,
from clients
where client_id in (select client_id from (select *from clients_datacap_allowances where allocator_id = '${params.allocator_id}'))
```

<DataTable
  data={allowances_client_details}
  emptySet=pass
  emptyMessage="No Clients"
  link=link
/>

## Allocations Histogram Distribution

<Histogram
  data={datacap_allowances}
  x=allowance_tibs
  xAxisTitle="Datacap Allocation Size"
  title="Datacap Allocation Size Distribution"
  emptySet=pass
  emptyMessage="No Datacap Allocations"
/>
