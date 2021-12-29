@EndUserText.label: 'Product to market'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
@UI: {
  headerInfo: { typeName: 'Market',
                typeNamePlural: 'Markets',
                title: { type: #STANDARD, value: 'Mrktid' } } }
define view entity ZAP_C_PMARKET as projection on ZAP_I_PMARKET as Market

{   @UI.facet: [ { id:            'Market',
                     purpose:       #STANDARD,
                     type:          #IDENTIFICATION_REFERENCE,
                     label:         'Market',
                     position:      10 }]
     @UI.hidden: true
    key prod_uuid,
     @UI.hidden: true
    key mrkt_uuid,
     @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Market ID' } ] }
    @Search.defaultSearchElement: true
    Mrktid,
     @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Status' } ] }
    Status,
    @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30, label: 'Start Dates' } ] }
    Startdate,
    @UI: {
          lineItem:       [ { position: 40, importance: #HIGH } ],
          identification: [ { position: 40, label: 'end Date' } ] }
    Enddate,
     @Semantics.user.createdBy: true 
    CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    CreationTime,
    @Semantics.user.lastChangedBy: true
    ChangedBy,
     @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    ChangeTime,
    /* Associations */
    _Product : redirected to parent zap_c_product
}
