@EndUserText.label: 'Product to market ST'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
@UI: {
  headerInfo: { typeName: 'Market',
                typeNamePlural: 'Markets',
                title: { type: #STANDARD, value: 'mrktid' } },
                headerInfo.imageUrl: 'Url' }
define view entity ZAP_C_PMARK as projection on ZAP_I_PMARK as Market
{
     @UI.facet: [ { id:            'Market',
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
          identification: [ { position: 10, label: 'Market NM' } ] }
    @Search.defaultSearchElement: true
   mrktid,
    @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Market ID' } ] }
   @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_MARKET', element: 'Mrktid'  } }]
      market_id,
     @ObjectModel.text.element: ['Mname']
      @UI.hidden: true
      _CMarket.Mrktname as Mname,
      @UI.hidden: true
      _CMarket.Imageurl as Url,

     @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30, label: 'Status' } ] }
    status,
    @UI: {
          lineItem:       [ { position: 40, importance: #HIGH } ],
          identification: [ { position: 40, label: 'Start Dates' } ] }
    startdate,
    @UI: {
          lineItem:       [ { position: 50, importance: #HIGH } ],
          identification: [ { position: 50, label: 'end Date' } ] }
    enddate,
     @Semantics.user.createdBy: true 
    created_by,
    @Semantics.systemDateTime.createdAt: true
    creation_time,
    @Semantics.user.lastChangedBy: true
    changed_by,
     @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time,
    /* Associations */
    _Product : redirected to parent zap_c_prod,
    _CMarket
}
