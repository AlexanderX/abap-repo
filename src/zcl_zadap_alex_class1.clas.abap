CLASS zcl_zadap_alex_class1 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS do.
  PROTECTED SECTION.
  methods process1.
  methods process2.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zadap_alex_class1 IMPLEMENTATION.
METHOD do.
if 1 = 2.
me->process1( ).
endif.
ENDMETHOD.
METHOD process1.
me->process2( ).
ENDMETHOD.
METHOD process2.
if 1 = 1.

endif.
ENDMETHOD.
ENDCLASS.
