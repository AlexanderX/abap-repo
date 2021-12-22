@EndUserText.label: 'Interface view'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZAP_I_PRODUCT as select from zap_d_product
association [0..1] to I_Currency      as _Currency on $projection.price_currency = _Currency.Currency
association [0..1] to ZAP_I_PG      as _PGroup on $projection.pgid = _PGroup.pgid
association [0..1] to Zap_I_PHASE     as _Phase on $projection.phaseid = _Phase.Phaseid
 {
key prod_uuid,
prodid as Prodid,
pgid,
 @Consumption.valueHelpDefinition: [{  entity: {   name: 'Zap_I_PHASE' , 
                                                        element: 'phaseid'  }     }] 
phaseid,
height as Height,
depth as Depth,
width as Width,
size_uom,
price as Price,
price_currency,
taxrate as Taxrate,
@Semantics.user.createdBy: true
created_by as CreatedBy,
@Semantics.systemDateTime.createdAt: true
creation_time as CreationTime,
@Semantics.user.lastChangedBy: true
changed_by as ChangedBy,
change_time as ChangeTime,

_Currency,
_PGroup,
_Phase
    
}
