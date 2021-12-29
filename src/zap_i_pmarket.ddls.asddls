@EndUserText.label: 'Product to market'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAP_I_PMARKET as select from zap_d_prod_mrkt 
association to parent ZAP_I_PRODUCT as _Product on $projection.prod_uuid = _Product.prod_uuid
{
    key prod_uuid ,
    key mrkt_uuid ,
    mrktid as Mrktid,
    status as Status,
    startdate as Startdate,
    enddate as Enddate,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    creation_time as CreationTime,
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time as ChangeTime,
    _Product
}
