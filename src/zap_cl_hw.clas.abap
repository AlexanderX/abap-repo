CLASS zap_cl_hw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zap_cl_hw IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( |Hello ({ cl_abap_context_info=>get_user_technical_name(  ) })|  ).
      CATCH cx_abap_context_info_error.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
