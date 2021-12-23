CLASS lhc_product DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetPhase FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Product~SetPhase.
      METHODS SetAdminData FOR MODIFY
      IMPORTING keys FOR ACTION Product~SetAdminData.
ENDCLASS.

CLASS lhc_product IMPLEMENTATION.

  METHOD SetPhase.

   READ ENTITIES OF ZAP_I_PRODUCT IN LOCAL MODE
         ENTITY Product
            ALL FIELDS
            WITH CORRESPONDING #( keys )
         RESULT DATA(products).
    loop at products assigning field-symbol(<ls_product>).
      <ls_product>-phaseid = '1'.
    endloop.
     MODIFY ENTITIES OF ZAP_I_PRODUCT IN LOCAL MODE
      ENTITY Product
        UPDATE FIELDS ( phaseid )
        WITH CORRESPONDING #( products ).


  ENDMETHOD.
  METHOD setadmindata.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
