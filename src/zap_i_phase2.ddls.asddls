@EndUserText.label: 'Phase'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAP_I_PHASE2 as select from zap_d_phase {

  key phaseid,
  phase  
}
