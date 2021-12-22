@EndUserText.label: 'Product'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
define root view entity zap_c_product as projection on ZAP_I_PRODUCT {
 @UI.facet: [ { id:              'Product',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Product',
                     position:        10 } ]
    @UI.hidden: true
   key prod_uuid,
    @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Product ID' } ] }
      @Search.defaultSearchElement: true
    Prodid,
     @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Product Group' } ] }
     @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PG', element: 'pgid'  } }]
     @ObjectModel.text.element: ['Pgname']
      @Search.defaultSearchElement: true
      pgid,
      @UI.hidden: true
      _PGroup.Pgname as Pgname,
     @UI: {
          lineItem:       [ { position: 30, importance: #LOW, label: 'Phase', criticality: 'phaseid' }],
          identification: [ { position: 30, label: 'Phase', criticality: 'phaseid'} ] }
   @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PHASE', element: 'phaseid'  } }]
   @Search.defaultSearchElement: true
   @ObjectModel.text.element: ['Phase']
    phaseid,
    @UI.hidden: true
    _Phase.Phase as Phase,
    Height,
    Depth,
    Width,
     @UI: {
          lineItem:       [ { position: 40, importance: #LOW } ],
          identification: [ { position: 40, label: 'Price' } ] }
    Price,
     @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
         @UI: {
          lineItem:       [ { position: 40, importance: #LOW } ],
          identification: [ { position: 40, label: 'Currency' } ] }
    price_currency,
    Taxrate,
    CreatedBy,
    CreationTime,
    ChangedBy,
    ChangeTime
}
