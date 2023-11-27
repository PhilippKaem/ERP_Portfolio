CLASS zcm_pspk_employee DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "Interfaces
    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    " Message Constants

      CONSTANTS:
       BEGIN OF declined_Vac_App_App2,
        msgid TYPE symsgid      VALUE 'ZPSPK_EMP_DB',
        msgno TYPE symsgno      VALUE '201',
        attr1 TYPE scx_attrname VALUE 'VacAppComment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF declined_Vac_App_App2.

     CONSTANTS:
       BEGIN OF approved_Vac_App_App2,
        msgid TYPE symsgid      VALUE 'ZPSPK_EMP_DB',
        msgno TYPE symsgno      VALUE '202',
        attr1 TYPE scx_attrname VALUE 'VacAppComment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF approved_Vac_App_App2.

     CONSTANTS:
       BEGIN OF already_declined_Vac_App_App2,
        msgid TYPE symsgid      VALUE 'ZPSPK_EMP_DB',
        msgno TYPE symsgno      VALUE '203',
        attr1 TYPE scx_attrname VALUE 'VacAppComment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_declined_Vac_App_App2.

      CONSTANTS:
       BEGIN OF already_approved_Vac_App_App2,
        msgid TYPE symsgid      VALUE 'ZPSPK_EMP_DB',
        msgno TYPE symsgno      VALUE '204',
        attr1 TYPE scx_attrname VALUE 'VacAppComment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_approved_Vac_App_App2.


 " Attributs
 DATA VacAppComment TYPE zpspk_comment.
        METHODS constructor
      IMPORTING
        severity type if_abap_behv_message=>t_severity
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        VacAppComment TYPE zpspk_comment Optional.
 PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcm_pspk_employee IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    me->vacappcomment = vacappcomment.
     if_abap_behv_message~m_severity = severity.
  ENDMETHOD.
ENDCLASS.
