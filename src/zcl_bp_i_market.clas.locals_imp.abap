CLASS lhc_Market DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS confirm FOR MODIFY
      IMPORTING keys FOR ACTION Market~confirm RESULT result.

    METHODS checkMarket FOR VALIDATE ON SAVE
      IMPORTING keys FOR Market~checkMarket.

    METHODS dublicateCheck FOR VALIDATE ON SAVE
      IMPORTING keys FOR Market~dublicateCheck.

    METHODS endDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Market~endDate.

    METHODS startDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Market~startDate.

ENDCLASS.

CLASS lhc_Market IMPLEMENTATION.

  METHOD confirm.
  ENDMETHOD.

  METHOD checkMarket.
    READ ENTITIES OF zap_i_prod IN LOCAL MODE
       ENTITY Product BY  \_Market
         FIELDS ( market_id )
         WITH CORRESPONDING #( keys )
       RESULT DATA(lt_markets).
    IF NOT lt_markets IS INITIAL.
      SELECT FROM zap_d_market FIELDS mrktid
       FOR ALL ENTRIES IN @lt_markets
       WHERE mrktid = @lt_markets-market_id
       INTO TABLE @DATA(lt_market_db).
      IF sy-subrc = 0.
        LOOP AT lt_markets ASSIGNING FIELD-SYMBOL(<ls_market>).
          IF NOT line_exists( lt_market_db[ mrktid = <ls_market>-market_id ] ).
            APPEND VALUE #( %tky = <ls_market>-%tky ) TO failed-market.

            APPEND VALUE #( %tky = <ls_market>-%tky
                            %msg = NEW zap_cl_messages(
                                       textid = zap_cl_messages=>mrktid_wrong
                                       severity = if_abap_behv_message=>severity-error
                                       market_id = <ls_market>-market_id )
                                      %element-market_id = if_abap_behv=>mk-on
                          ) TO reported-market.
          ENDIF.
        ENDLOOP.
      ELSE.
        LOOP AT lt_markets ASSIGNING <ls_market>.
          APPEND VALUE #( %tky = <ls_market>-%tky ) TO failed-market.

          APPEND VALUE #( %tky = <ls_market>-%tky
                          %msg = NEW zap_cl_messages(
                                     textid = zap_cl_messages=>mrktid_wrong
                                     severity = if_abap_behv_message=>severity-error
                                     market_id = <ls_market>-market_id )
                                    %element-market_id = if_abap_behv=>mk-on
                        ) TO reported-market.
        ENDLOOP.
      ENDIF.


    ENDIF.
  ENDMETHOD.

  METHOD dublicateCheck.
  ENDMETHOD.

  METHOD endDate.
    READ ENTITIES OF zap_i_prod IN LOCAL MODE
       ENTITY Product BY  \_Market
         FIELDS ( market_id startdate enddate )
         WITH CORRESPONDING #( keys )
       RESULT DATA(lt_markets).
        LOOP AT lt_markets ASSIGNING FIELD-SYMBOL(<ls_market>).
          IF  <ls_market>-startdate > <ls_market>-enddate.
            APPEND VALUE #( %tky = <ls_market>-%tky ) TO failed-market.

            APPEND VALUE #( %tky = <ls_market>-%tky
                            %msg = NEW zap_cl_messages(
                                       textid = zap_cl_messages=>wrong_enddate
                                       severity = if_abap_behv_message=>severity-error
                                       market_id = <ls_market>-market_id
                                       start_date = <ls_market>-startdate
                                       end_date = <ls_market>-enddate )
                                      %element-enddate = if_abap_behv=>mk-on
                          ) TO reported-market.
          ENDIF.
        ENDLOOP.
  ENDMETHOD.

  METHOD startDate.
   READ ENTITIES OF zap_i_prod IN LOCAL MODE
       ENTITY Product BY  \_Market
         FIELDS ( market_id startdate enddate )
         WITH CORRESPONDING #( keys )
       RESULT DATA(lt_markets).
        LOOP AT lt_markets ASSIGNING FIELD-SYMBOL(<ls_market>).
          IF  <ls_market>-startdate < cl_abap_context_info=>get_system_date( ).
            APPEND VALUE #( %tky = <ls_market>-%tky ) TO failed-market.

            APPEND VALUE #( %tky = <ls_market>-%tky
                            %msg = NEW zap_cl_messages(
                                       textid = zap_cl_messages=>wrong_startdate
                                       severity = if_abap_behv_message=>severity-error
                                       market_id = <ls_market>-market_id
                                       start_date = <ls_market>-startdate
                                       end_date = <ls_market>-enddate )
                                      %element-startdate = if_abap_behv=>mk-on
                          ) TO reported-market.
          ENDIF.
        ENDLOOP.
  ENDMETHOD.

ENDCLASS.
