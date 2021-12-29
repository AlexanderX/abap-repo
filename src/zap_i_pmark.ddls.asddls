@EndUserText.label: 'Product to market'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAP_I_PMARK as select from zap_d_prod_mrkt 
association to parent ZAP_I_PROD as _Product on $projection.prod_uuid = _Product.prod_uuid
{
    key prod_uuid ,
    key mrkt_uuid ,
    mrktid ,
    status ,
    startdate ,
    enddate ,
    @Semantics.user.createdBy: true
    created_by ,
    @Semantics.systemDateTime.createdAt: true
    creation_time ,
    @Semantics.user.lastChangedBy: true
    changed_by ,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time ,
    _Product
}
