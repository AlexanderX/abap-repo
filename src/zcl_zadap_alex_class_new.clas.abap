CLASS zcl_zadap_alex_class_new DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
   data ms_place type zadap_alex_s_test.
   METHODS do_init IMPORTING is_place type zadap_alex_s_test.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zadap_alex_class_new IMPLEMENTATION.
 method do_init.
  ms_place = is_place.
 ENDMETHOD.
ENDCLASS.
