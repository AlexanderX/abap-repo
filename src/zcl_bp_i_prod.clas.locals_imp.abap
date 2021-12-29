CLASS lhc_Product DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS SetPhase FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Product~SetPhase.

    METHODS ValidateProdid FOR VALIDATE ON SAVE
      IMPORTING keys FOR Product~ValidateProdid.

ENDCLASS.

CLASS lhc_Product IMPLEMENTATION.

  METHOD SetPhase.
   READ ENTITIES OF zap_i_prod IN LOCAL MODE
      ENTITY Product
        FIELDS ( phaseid )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_products).
      delete lt_products WHERE phaseid is not INITIAL.
    IF NOT lt_products IS INITIAL.
     MODIFY ENTITIES of zap_i_prod IN LOCAL MODE
      ENTITY Product
      update
      fields ( phaseid )
       with value #( for ls_product in lt_products ( %tky = ls_product-%tky
                                                     phaseid = '1' ) )
                                                     reported data(update_reported).
        reported = corresponding #(  DEEP update_reported ).
    endif.
  ENDMETHOD.

  METHOD ValidateProdid.
    READ ENTITIES OF zap_i_prod IN LOCAL MODE
      ENTITY Product
        FIELDS ( prodid )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_products).
    IF NOT lt_products IS INITIAL.
      SELECT FROM zap_d_product FIELDS prodid
       FOR ALL ENTRIES IN @lt_products
       WHERE prodid = @lt_products-prodid
       INTO TABLE @DATA(lt_product_db).
      IF sy-subrc = 0.
        LOOP AT lt_products ASSIGNING FIELD-SYMBOL(<ls_product>).
          APPEND VALUE #( %tky = <ls_product>-%tky ) TO failed-product.

          APPEND VALUE #( %tky = <ls_product>-%tky
                          %msg = NEW zap_cl_messages(
                                     textid = zap_cl_messages=>prodid_exists
                                     severity = if_abap_behv_message=>severity-error
                                     product_id = <ls_product>-prodid )
                          %element-prodid = if_abap_behv=>mk-on
                        ) TO reported-product.
        ENDLOOP.
      ENDIF.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
