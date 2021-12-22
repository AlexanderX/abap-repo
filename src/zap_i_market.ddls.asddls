@EndUserText.label: 'Market'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZAP_I_MARKET as select from zap_d_market {
    key mrktid as Mrktid,
    mrktname as Mrktname,
    code as Code,
    imageurl as Imageurl
}
