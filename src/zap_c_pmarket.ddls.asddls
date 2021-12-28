@EndUserText.label: 'Product to market'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZAP_C_PMARKET as projection on ZAP_I_PMARKET as Market
{
    key ProdUuid,
    key MrktUuid,
    @Search.defaultSearchElement: true
    Mrktid,
    Status,
    Startdate,
    Enddate,
    CreatedBy,
    CreationTime,
    ChangedBy,
    ChangeTime,
    /* Associations */
    _Product : redirected to parent zap_c_product
}
