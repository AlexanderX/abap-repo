CLASS zap_cl_messages DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES if_abap_behv_message .

    CONSTANTS:
      gc_msgid TYPE symsgid VALUE 'ZAP_PRODUCTS_RAP',

      BEGIN OF prodid_exists,
        msgid TYPE symsgid VALUE 'ZAP_PRODUCTS_RAP',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_PRODUCT_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF prodid_exists,
      BEGIN OF wrong_enddate,
        msgid TYPE symsgid VALUE 'ZAP_PRODUCTS_RAP',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_ENDDATE',
        attr2 TYPE scx_attrname VALUE 'MV_STARTDATE',
        attr3 TYPE scx_attrname VALUE 'MV_MARKID',
        attr4 TYPE scx_attrname VALUE '',
      END OF wrong_enddate,
      BEGIN OF wrong_startdate,
        msgid TYPE symsgid VALUE 'ZAP_PRODUCTS_RAP',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'MV_STARTDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF wrong_startdate,
      BEGIN OF mrktid_wrong,
        msgid TYPE symsgid VALUE 'ZAP_PRODUCTS_RAP',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'MV_MARKID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF mrktid_wrong.


    METHODS constructor
      IMPORTING
        textid                LIKE if_t100_message=>t100key OPTIONAL
        attr1                 TYPE i OPTIONAL
        attr2                 TYPE string OPTIONAL
        attr3                 TYPE string OPTIONAL
        attr4                 TYPE string OPTIONAL
        previous              LIKE previous OPTIONAL
        product_id            TYPE zap_product_id OPTIONAL
        severity              TYPE if_abap_behv_message=>t_severity OPTIONAL
        uname                 TYPE syuname OPTIONAL
        market_id             TYPE zap_market_id OPTIONAL
        start_date TYPE zap_start_date OPTIONAL
        end_date type zap_end_date OPTIONAL.


    DATA:
      mv_attr1                 TYPE string,
      mv_attr2                 TYPE string,
      mv_attr3                 TYPE string,
      mv_attr4                 TYPE string,
      mv_product_id            TYPE zap_product_id,
      mv_uname                 TYPE syuname,
      mv_enddate               TYPE zap_end_date,
      mv_startdate             TYPE zap_start_date,
      mv_markid type zap_market_id.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zap_cl_messages IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(  previous = previous ) .

    me->mv_attr1                 = attr1.
    me->mv_attr2                 = attr2.
    me->mv_attr3                 = attr3.
    me->mv_attr4                 = attr4.
    me->mv_product_id            = product_id.
    me->mv_uname                 = uname.
    me->mv_markid                = market_id.
    me->mv_startdate = start_date.
    me->mv_enddate = end_date.


    if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
