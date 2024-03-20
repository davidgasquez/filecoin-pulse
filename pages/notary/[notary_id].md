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
  mean(datacap::bigint) as datacap
from notaries_datacap
where verifier_id = '${params.notary_id}'
group by updated_at
order by updated_at desc
```

## Datacap Changes

<AreaChart
    data={datacap_balance_history}
    x=day
    y=datacap
/>

<DataTable data={datacap_balance_history}/>
