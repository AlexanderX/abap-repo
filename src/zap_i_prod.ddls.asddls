@EndUserText.label: 'Products second try'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAP_I_PROD as select from zap_d_product 
composition [0..* ] of ZAP_I_PMARK as _Market
association [0..1] to I_Currency      as _Currency on $projection.price_currency = _Currency.Currency
association [0..1] to ZAP_I_PG      as _PGroup on $projection.pgid = _PGroup.pgid
association [0..1] to ZAP_I_PHASE2     as _Phase on $projection.phaseid = _Phase.phaseid
 
{
    key prod_uuid ,
    prodid ,
    pgid ,
    pgname ,
    phaseid ,
    @Semantics.quantity.unitOfMeasure : 'size_uom'
    height ,
    @Semantics.quantity.unitOfMeasure : 'size_uom'
    depth ,
    @Semantics.quantity.unitOfMeasure : 'size_uom'
    width ,
    size_uom ,
    @Semantics.amount.currencyCode: 'price_currency'
    price ,
    price_currency ,
    taxrate ,
    @Semantics.user.createdBy: true
    created_by ,
    @Semantics.systemDateTime.createdAt: true
    creation_time ,
    @Semantics.user.lastChangedBy: true
    changed_by ,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time,
    _Currency,
    _PGroup,
    _Phase,
    _Market
}
