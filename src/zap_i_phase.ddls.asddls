@EndUserText.label: 'Phase'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Zap_I_PHASE as select from zap_d_phase {

  key phaseid as Phaseid,
  phase as Phase  
}
