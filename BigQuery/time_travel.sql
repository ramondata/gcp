select 
  *
 from `table`
 FOR SYSTEM_TIME AS OF
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 DAY)

 
- example:
```insert into `table-destination`
select
effect_protocol  ,		
effect_priority ,
effect_priority_ap7 ,
effect_trade_repository ,
effect_type ,
effect_beneficiary ,
effect_division_rule ,
CAST(effect_value AS NUMERIC) effect_value,
effect_account_holder ,
effect_account_type ,
effect_account_compe ,
effect_account_ispb ,
effect_account_agency ,
effect_account_number ,
effect_created_at ,
effect_contract_id ,
tio_file ,
contract_owner_hash ,
contract_original_requester_hash ,
asset_commitment_hash,
contract_reference ,
CAST(amount_requested AS NUMERIC) amount_requested ,
CAST(amount_granted AS NUMERIC) amount_granted ,
reference_date
from `table-base`
FOR SYSTEM_TIME AS OF TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)
where date='2024-01-14'
```
