@EndUserText.label: 'Product groups'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAP_I_PG as select from zap_d_prod_group {
 key pgid,
 pgname as Pgname,
 imageurl as Imageurl   
}
