@EndUserText.label: 'Product'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
 headerInfo: { typeName: 'Kitchen Appliance', typeNamePlural: 'Kitchen Appliances', title: { type: #STANDARD, value: 'Prodid' , iconUrl: 'Url'} } }

@Search.searchable: true
define root view entity zap_c_product as projection on ZAP_I_PRODUCT {
 @UI.facet: [ { id:              'Product', 
                type:            #COLLECTION,
                label:           'General Information' },
                { id:              'AdminData', 
                type:            #COLLECTION,
                label:           'Admin Data' },
                {
       parentId: 'Product',
       id:'group1Information',
       type: #FIELDGROUP_REFERENCE,
       targetQualifier: 'one',
       label: 'Basic data'
       }, 
       {parentId: 'Product',
       id:'group2Information',
       type: #FIELDGROUP_REFERENCE,
       targetQualifier: 'two',
       label: 'Details'
       },
       {parentId: 'AdminData',
       id:'group3Information',
       type: #FIELDGROUP_REFERENCE,
       targetQualifier: '3re',
       label: 'Admin Data'
       },
       { id:              'Market', 
         purpose: #STANDARD,
         type:            #LINEITEM_REFERENCE,
         label:           'Market Data',
         targetElement: '_Market'  }
                ]
    @UI.hidden: true
   key prod_uuid,
    @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Product ID' } ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
      @Search.defaultSearchElement: true
    Prodid,
     @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Product Group' } ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
     @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PG', element: 'pgid'  } }]
     @ObjectModel.text.element: ['Pgname']
      @Search.defaultSearchElement: true
      pgid,
      @UI.hidden: true
      _PGroup.Pgname as Pgname,
      @UI.hidden: true
      _PGroup.Imageurl as Url,
     @UI: {
          lineItem:       [ { position: 30, importance: #LOW, label: 'Phase', criticality: 'phaseid' }],
          identification: [ { position: 30, label: 'Phase', criticality: 'phaseid'} ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
   @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PHASE2', element: 'phaseid'  } }]
   @Search.defaultSearchElement: true
   @ObjectModel.text.element: ['phase']
    phaseid,
    @UI.hidden: true
    _Phase.phase as Phase,
    @UI: {
          lineItem:       [ { position: 50, importance: #LOW, label:  'Height' }],
          identification: [ { position: 50, label: 'Height'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    Height,
        @UI: {
          lineItem:       [ { position: 60, importance: #LOW, label:  'Depth' }],
          identification: [ { position: 60, label: 'Depth'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    Depth,
            @UI: {
          lineItem:       [ { position: 70, importance: #LOW, label:  'Width' }],
          identification: [ { position: 70, label: 'Width'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    Width,
    @Consumption.valueHelpDefinition: [{entity: {name: 'ZAP_I_UOM', element: 'msehi' }}]
    size_uom,
     @UI: {
          lineItem:       [ { position: 40, importance: #LOW } ],
          identification: [ { position: 40, label: 'Price' } ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.amount.currencyCode: 'price_currency'
    Price,
     @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
    price_currency,
    Taxrate,
     @UI: {
          identification: [ { position: 10, label: 'Created By' } ],
          fieldGroup: [{position: 10, qualifier: '3re' }] }
           @Semantics.user.createdBy: true 
    CreatedBy,
        @UI: {
          identification: [ { position: 20, label: 'Created On' } ],
          fieldGroup: [{position: 10, qualifier: '3re' }] }
          @Semantics.systemDateTime.createdAt: true
    CreationTime,
     @UI: {
          identification: [ { position: 30, label: 'Changed By' } ],
          fieldGroup: [{position: 20, qualifier: '3re' }] }
    @Semantics.user.lastChangedBy: true
    ChangedBy,
  @UI.hidden: true
    @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time,
         @UI: {
          identification: [ { position: 50, label: 'Changed On' } ],
          fieldGroup: [{position: 20,qualifier: '3re' }] }
    change_dat, 
         @UI: {
          identification: [ { position: 40, label: 'Changed At' } ],
          fieldGroup: [{position: 20,qualifier: '3re' }] }
    change_tim,
    _Market : redirected to composition child ZAP_C_PMARKET
      
    
}
