@EndUserText.label: 'Interface view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAP_I_PRODUCT as select from zap_d_product
composition [0..*] of ZAP_I_PMARKET as _Market 
association [0..1] to I_Currency      as _Currency on $projection.price_currency = _Currency.Currency
association [0..1] to ZAP_I_PG      as _PGroup on $projection.pgid = _PGroup.pgid
association [0..1] to ZAP_I_PHASE2     as _Phase on $projection.phaseid = _Phase.phaseid
 {
key prod_uuid,
prodid as Prodid,
pgid,
phaseid,
@Semantics.quantity.unitOfMeasure : 'size_uom'
height as Height,
@Semantics.quantity.unitOfMeasure : 'size_uom'
depth as Depth,
@Semantics.quantity.unitOfMeasure : 'size_uom'
width as Width,
size_uom,
@Semantics.amount.currencyCode: 'price_currency'
price as Price,
price_currency,
taxrate as Taxrate,
@Semantics.user.createdBy: true
created_by as CreatedBy,
@Semantics.systemDateTime.createdAt: true
creation_time as CreationTime,
@Semantics.user.lastChangedBy: true
changed_by as ChangedBy,
@Semantics.systemDateTime.localInstanceLastChangedAt: true 
change_time,
tstmp_to_dats( change_time,
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' )      as change_dat,
      tstmp_to_tims( change_time,
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' )      as change_tim,
_Currency,
_PGroup,
_Phase,
_Market
    
}
