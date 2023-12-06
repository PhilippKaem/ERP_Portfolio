CLASS lhc_ZR_PSPK_Vacation_Applicati DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_PSPK_Vacation_Application_2 RESULT result.
    METHODS approvevacationapplication FOR MODIFY
      IMPORTING keys FOR ACTION zr_pspk_vacation_application_2~approvevacationapplication RESULT result.

    METHODS declinevacationapplication FOR MODIFY
      IMPORTING keys FOR ACTION zr_pspk_vacation_application_2~declinevacationapplication RESULT result.

ENDCLASS.

CLASS lhc_ZR_PSPK_Vacation_Applicati IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ApproveVacationApplication.
  DATA message TYPE REF TO zcm_pspk_employee.
  " Read Vacation Applications
  READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application_2
   FIELDS ( VacAppStatus VacAppComment )
  WITH CORRESPONDING #( keys )
  RESULT DATA(VacationApplications).
  " Process
   LOOP AT VacationApplications REFERENCE INTO DATA(VacationApplication).
  " Validate Status and Create Error Message
  IF VacationApplication->VacAppStatus = 'G'.
        message = NEW zcm_pspk_employee(
         severity = if_abap_behv_message=>severity-error
         textid = zcm_pspk_employee=>already_approved_vac_app_app2
                                  vacappcomment = vacationapplication->VacAppComment ).
        APPEND VALUE #( %tky     = VacationApplication->%tky
                        %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-zr_pspk_vacation_application_2.
        APPEND VALUE #( %tky = VacationApplication->%tky ) TO failed-zr_pspk_vacation_application_2.
           delete VacationApplications index sy-tabix.
        CONTINUE.
      ENDIF.

      IF VacationApplication->VacAppStatus = 'A'.
        message = NEW zcm_pspk_employee(
         severity = if_abap_behv_message=>severity-error
         textid = zcm_pspk_employee=>already_declined_vac_app_app2
                                  vacappcomment = vacationapplication->VacAppComment ).
        APPEND VALUE #( %tky     = VacationApplication->%tky
                        %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-zr_pspk_vacation_application_2.
        APPEND VALUE #( %tky = VacationApplication->%tky ) TO failed-zr_pspk_vacation_application_2.
           delete VacationApplications index sy-tabix.
        CONTINUE.
      ENDIF.

    "Set Status to Approved and Create Success Message
    vacationapplication->VacAppStatus = 'G'.
        message = new zcm_pspk_employee(
    severity = if_abap_behv_message=>severity-success
    textid = zcm_pspk_employee=>approved_vac_app_app2
    vacappcomment = vacationapplication->VacAppComment ).

    APPEND VALUE #( %tky = vacationapplication->%tky
                    %element = value #( VacAppStatus = if_abap_behv=>mk-on )
                    %msg = message ) to reported-zr_pspk_vacation_application_2.

    "Modify Vacationapplications
    Modify entity in local mode ZR_PSPK_Vacation_Application_2
        UPDATE FIELDS ( VacAppStatus )
        WITH VALUE #( for t in VacationApplications ( %tky = t-%tky VacAppStatus = t-VacAppStatus ) ).

    "Set Result
    result = VALUE #( FOR t IN VacationApplications
                      ( %tky   = t-%tky
                        %param = t ) ).
  ENDLOOP.
  ENDMETHOD.

  METHOD DeclineVacationApplication.

    DATA message TYPE REF TO zcm_pspk_employee.

      " Read Vacation Applications
      READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application_2
       FIELDS ( VacAppStatus VacAppComment )
      WITH CORRESPONDING #( keys )
      RESULT DATA(VacationApplications).

  " Process
   LOOP AT VacationApplications REFERENCE INTO DATA(VacationApplication).

  " Validate Status and Create Error Message
  IF VacationApplication->VacAppStatus = 'G'.
        message = NEW zcm_pspk_employee(
         severity = if_abap_behv_message=>severity-error
         textid = zcm_pspk_employee=>already_approved_vac_app_app2
                                  vacappcomment = vacationapplication->VacAppComment ).
        APPEND VALUE #( %tky     = VacationApplication->%tky
                        %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-zr_pspk_vacation_application_2.
        APPEND VALUE #( %tky = VacationApplication->%tky ) TO failed-zr_pspk_vacation_application_2.
           delete VacationApplications index sy-tabix.
        CONTINUE.
      ENDIF.

      IF VacationApplication->VacAppStatus = 'A'.
        message = NEW zcm_pspk_employee(
         severity = if_abap_behv_message=>severity-error
         textid = zcm_pspk_employee=>already_declined_vac_app_app2
                                  vacappcomment = vacationapplication->VacAppComment ).
        APPEND VALUE #( %tky     = VacationApplication->%tky
                        %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-zr_pspk_vacation_application_2.
        APPEND VALUE #( %tky = VacationApplication->%tky ) TO failed-zr_pspk_vacation_application_2.
           delete VacationApplications index sy-tabix.
        CONTINUE.
      ENDIF.

    "Set Status to Declined and Create Success Message
    vacationapplication->VacAppStatus = 'A'.
        message = new zcm_pspk_employee(
    severity = if_abap_behv_message=>severity-success
    textid = zcm_pspk_employee=>declined_vac_app_app2
    vacappcomment = vacationapplication->VacAppComment ).

    APPEND VALUE #( %tky = vacationapplication->%tky
                    %element = value #( VacAppStatus = if_abap_behv=>mk-on )
                    %msg = message ) to reported-zr_pspk_vacation_application_2.

    "Modify Vacationapplications
    Modify entity in local mode ZR_PSPK_Vacation_Application_2
        UPDATE FIELDS ( VacAppStatus )
        WITH VALUE #( for t in VacationApplications ( %tky = t-%tky VacAppStatus = t-VacAppStatus ) ).

    "Set Result
    result = VALUE #( FOR t IN VacationApplications
                      ( %tky   = t-%tky
                        %param = t ) ).
  ENDLOOP.

  ENDMETHOD.

ENDCLASS.
