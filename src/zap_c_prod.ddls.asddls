@EndUserText.label: 'Product projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
 headerInfo: { typeName: 'Kitchen Appliance', typeNamePlural: 'Kitchen Appliances', 
               title: { type: #STANDARD, value: 'prodid' , iconUrl: 'Url'} },
               headerInfo.imageUrl: 'Url' }

@Search.searchable: true
define root view entity zap_c_prod as projection on ZAP_I_PROD {
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
         targetElement: '_Market'  }]
    @UI.hidden: true
    key prod_uuid,
        @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Product ID' } ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
      @Search.defaultSearchElement: true
    prodid,
    @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Product Group' } ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
     @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PG', element: 'pgid'  } }]
     @ObjectModel.text.element: ['Pgname']
      @Search.defaultSearchElement: true
    pgid,
    _PGroup.Pgname as Pgname,
          @UI.hidden: true
      _PGroup.Imageurl as Url,
       @UI: {
          lineItem:       [ { position: 30, importance: #LOW, label: 'Phase', criticality: 'phaseid' },
                            { type: #FOR_ACTION, dataAction: 'move_to_next_phase', label: 'Next Phase'}],
          identification: [ { position: 30, label: 'Phase', criticality: 'phaseid'},
                            { type: #FOR_ACTION, dataAction: 'move_to_next_phase', label: 'Next Phase'} ],
          fieldGroup: [{position: 10, qualifier: 'one' }] }
   @Consumption.valueHelpDefinition: [{ entity : {name: 'ZAP_I_PHASE2', element: 'phaseid'  } }]
   @Search.defaultSearchElement: true
   @ObjectModel.text.element: ['Phase']
    phaseid,
        @UI.hidden: true
    _Phase.phase as Phase,
     @UI: {
          lineItem:       [ { position: 50, importance: #LOW, label:  'Height' }],
          identification: [ { position: 50, label: 'Height'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    height,
        @UI: {
          lineItem:       [ { position: 60, importance: #LOW, label:  'Depth' }],
          identification: [ { position: 60, label: 'Depth'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    depth,
            @UI: {
          lineItem:       [ { position: 70, importance: #LOW, label:  'Width' }],
          identification: [ { position: 70, label: 'Width'} ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.quantity.unitOfMeasure:'size_uom'
    width,
    @Consumption.valueHelpDefinition: [{entity: {name: 'ZAP_I_UOM', element: 'msehi' }}]
    size_uom,
     @UI: {
          lineItem:       [ { position: 40, importance: #LOW } ],
          identification: [ { position: 40, label: 'Price' } ],
          fieldGroup: [{position: 10, qualifier: 'two' }] }
          @Semantics.amount.currencyCode: 'price_currency'
    price,
     @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
    price_currency,
    taxrate,
    @UI: {
          identification: [ { position: 10, label: 'Created By' } ],
          fieldGroup: [{position: 10, qualifier: '3re' }] }
           @Semantics.user.createdBy: true 
    created_by,
     @UI: {
          identification: [ { position: 20, label: 'Created On' } ],
          fieldGroup: [{position: 10, qualifier: '3re' }] }
          @Semantics.systemDateTime.createdAt: true
    creation_time,
    @UI: {
          identification: [ { position: 30, label: 'Changed By' } ],
          fieldGroup: [{position: 20, qualifier: '3re' }] }
    @Semantics.user.lastChangedBy: true
    changed_by,
        @UI: {
          identification: [ { position: 40, label: 'Changed On' } ],
          fieldGroup: [{position: 30, qualifier: '3re' }] }
    @Semantics.systemDateTime.localInstanceLastChangedAt: true 
    change_time,
    /* Associations */
    _Currency,
    _PGroup,
    _Phase,
    _Market : redirected to composition child ZAP_C_PMARK
}
