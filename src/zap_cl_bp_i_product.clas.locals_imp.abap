CLASS lhc_product DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetPhase FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Product~SetPhase.
    METHODS SetAdminData FOR MODIFY
      IMPORTING keys FOR ACTION Product~SetAdminData.
ENDCLASS.

CLASS lhc_product IMPLEMENTATION.

  METHOD SetPhase.

    READ ENTITIES OF zap_i_product IN LOCAL MODE
          ENTITY Product
             ALL FIELDS
             WITH CORRESPONDING #( keys )
          RESULT DATA(lt_products)
          FAILED DATA(lt_failed).

    DELETE lt_products WHERE phaseid IS NOT INITIAL.
    IF lt_products IS NOT INITIAL.
      MODIFY ENTITIES OF zap_i_product IN LOCAL MODE
       ENTITY Product
        UPDATE SET FIELDS
         WITH VALUE #( FOR key IN keys ( %tky    = key-%tky
                                          phaseid = '1'
                                          CreatedBy = sy-uname ) )

REPORTED DATA(lt_reported)
.

      reported = CORRESPONDING #( DEEP lt_reported ).
    ENDIF.





  ENDMETHOD.
  METHOD setadmindata.
   READ ENTITIES OF zap_i_product IN LOCAL MODE
          ENTITY Product
             ALL FIELDS
             WITH CORRESPONDING #( keys )
          RESULT DATA(lt_products)
          FAILED DATA(lt_failed).
  loop at lt_products assigning field-symbol(<ls_product>).
    <ls_product>-ChangedBy = sy-uname.
    <ls_product>-ChangeTime = cl_abap_context_info=>get_system_date(  ).
  endloop.
         MODIFY ENTITIES OF zap_i_product IN LOCAL MODE
      ENTITY Product
        UPDATE FIELDS ( ChangedBy ChangeTime  )
        WITH CORRESPONDING #( lt_products ).
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
