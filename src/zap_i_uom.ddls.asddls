@EndUserText.label: 'Uom'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAP_I_UOM as select from zap_d_uom {
    key msehi,
    dimid,
    isocode
}
