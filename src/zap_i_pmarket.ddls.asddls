@EndUserText.label: 'Product to market'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAP_I_PMARKET as select from zap_d_prod_mrkt {
    key prod_uuid as ProdUuid,
    key mrkt_uuid as MrktUuid,
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
    change_time as ChangeTime
}
