CLASS lhc_vacationapplication DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineVacationApplicationID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineVacationApplicationID.
    METHODS DetermineVacationApplicantID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineVacationApplicantID.
    METHODS DetermineVacApplicationStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineVacApplicationStatus.
    METHODS ValidateIfEndBeforeBegin FOR VALIDATE ON SAVE
      IMPORTING keys FOR VacationApplication~ValidateIfEndBeforeBegin.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR VacationApplication RESULT result.
    METHODS DetermineResetVacAppStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineResetVacAppStatus.
    METHODS DetermineVacationDays FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineVacationDays.
    METHODS ValidateNotEnoughVacDays FOR VALIDATE ON SAVE
      IMPORTING keys FOR VacationApplication~ValidateNotEnoughVacDays.

ENDCLASS.



CLASS lhc_vacationapplication IMPLEMENTATION.

  METHOD DetermineVacationApplicationID.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Employee
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(employees)
         BY \_VacationApplications
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationApplications).

    " Process Vacation Applications
    LOOP AT vacationApplications REFERENCE INTO DATA(vacationApplication).

      " Set Vacation Application ID
      SELECT FROM zpspk_vac_app_db FIELDS MAX( id ) INTO @DATA(max_vacation_application_id).
      vacationapplication->VacationApplicationId = max_vacation_application_id + 1.

    ENDLOOP.

    " Modify Vacation Applications
    MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
           UPDATE FIELDS ( VacationApplicationId )
           WITH VALUE #( FOR v IN vacationapplications
                         ( %tky     = vacationapplication->%tky
                           VacationApplicationId = vacationapplication->VacationApplicationId ) ).

  ENDMETHOD.

  METHOD DetermineVacationApplicantID.

    " Read Vacation Applicants
    READ ENTITY IN LOCAL MODE ZR_PSPK_Employee
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(employees)
         BY \_VacationApplications
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationApplicants).

    " Process Vacation Applicants
    LOOP AT vacationApplicants REFERENCE INTO DATA(vacationApplicant).

      LOOP AT employees REFERENCE INTO DATA(employee).

          " Set Vacation Applicant ID
          vacationapplicant->VacAppApplicant = employee->EmployeeId.

      ENDLOOP.

    ENDLOOP.

    " Modify Vacation Applicant
    MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
           UPDATE FIELDS ( VacAppApplicant )
           WITH VALUE #( FOR v IN vacationapplicants
                         ( %tky     = vacationapplicant->%tky
                           VacAppApplicant = vacationapplicant->VacAppApplicant ) ).

  ENDMETHOD.

  METHOD DetermineVacApplicationStatus.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        FIELDS ( VacAppStatus )
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacationApplications).

    " Modify Vacation Applications
    MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
           UPDATE FIELDS ( VacAppStatus )
           WITH VALUE #( FOR v IN vacationApplications
                         ( %tky = v-%tky
                           VacAppStatus = 'B' ) ).

  ENDMETHOD.

  METHOD ValidateIfEndBeforeBegin.

    DATA message TYPE REF TO zcm_pspk_employee.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacationApplications).

    " Process Vacation Applications
    LOOP AT vacationapplications INTO DATA(vacationApplication).

        " Validate Vacation Application and create Error Message
        IF vacationapplication-VacAppEndDate < vacationapplication-VacAppStartDate.

            message = new zcm_pspk_employee(
                severity = if_abap_behv_message=>severity-error
                textid = zcm_pspk_employee=>end_before_begin_vac_app_emp vacappcomment = vacationapplication-VacAppComment ).
            APPEND VALUE #( %tky     = VacationApplication-%tky
                            %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                            %msg     = message ) TO reported-vacationapplication.
            APPEND VALUE #( %tky = VacationApplication-%tky ) TO failed-vacationapplication.


        ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD DetermineResetVacAppStatus.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        FIELDS ( VacAppStatus )
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacationApplications).

    " Process Vacation Applications
    LOOP AT vacationApplications REFERENCE INTO DATA(vacationApplication).

      IF vacationapplication->VacAppStatus = 'G'.

        " Modify Vacation Applications
        MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        UPDATE FIELDS ( VacAppStatus )
        WITH VALUE #( FOR v IN vacationApplications
                      ( %tky = v-%tky
                        VacAppStatus = 'B' ) ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD DetermineVacationDays.

    DATA message TYPE REF TO zcm_pspk_employee.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacationApplications).

    " Process Vacation Applications
    LOOP AT vacationapplications INTO DATA(vacationApplication).

        " Calculate the necessary Vacation Days
        try.
            data(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          catch cx_fhc_runtime.
            "handle exception
            RETURN.
        endtry.

        try.
            data(working_days) = calendar->calc_workingdays_between_dates( iv_start = vacationapplication-vacappstartdate iv_end = vacationapplication-vacappenddate ).
          catch cx_fhc_runtime.
            "handle exception
            RETURN.
        endtry.

        " Modify Vacation Applications
        MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        UPDATE FIELDS ( VacAppVacDays )
        WITH VALUE #( FOR v IN vacationApplications
                      ( %tky = v-%tky
                        VacAppVacDays = working_days + 1 ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD ValidateNotEnoughVacDays.

    DATA message TYPE REF TO zcm_pspk_employee.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(vacationApplications).

    " Process Vacation Applications
    LOOP AT vacationapplications INTO DATA(vacationApplication).

        " Calculate the necessary Vacation Days
        try.
            data(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          catch cx_fhc_runtime.
            "handle exception
            RETURN.
        endtry.

        try.
            data(application_days) = calendar->calc_workingdays_between_dates( iv_start = vacationapplication-vacappstartdate iv_end = vacationapplication-vacappenddate ) + 1.
          catch cx_fhc_runtime.
            "handle exception
            RETURN.
        endtry.

        SELECT SINGLE FROM zpspk_vac_ent_db FIELDS SUM( vac_vacation_days ) WHERE vac_ent_employee = @vacationapplication-VacAppApplicant INTO @DATA(vac_all_days).
        SELECT SINGLE FROM zpspk_vac_app_db FIELDS SUM( vac_app_planned_vac_days ) WHERE vac_app_applicant = @vacationapplication-VacAppApplicant AND vac_app_status = 'B' INTO @DATA(vac_all_planned_b_days).
        SELECT SINGLE FROM zpspk_vac_app_db FIELDS SUM( vac_app_planned_vac_days ) WHERE vac_app_applicant = @vacationapplication-VacAppApplicant AND vac_app_status = 'G' INTO @DATA(vac_all_planned_g_days).

        DATA(free_vac_days) = vac_all_days - vac_all_planned_b_days - vac_all_planned_g_days.

        " Validate Vacation Application and create Error Message
        IF application_days > free_vac_days.
            message = new zcm_pspk_employee(
                severity = if_abap_behv_message=>severity-error
                textid = zcm_pspk_employee=>not_enough_days_vac_app_emp vacappcomment = vacationapplication-VacAppComment ).
            APPEND VALUE #( %tky     = VacationApplication-%tky
                            %element = VALUE #( VacAppStatus = if_abap_behv=>mk-on )
                            %msg     = message ) TO reported-vacationapplication.
            APPEND VALUE #( %tky = VacationApplication-%tky ) TO failed-vacationapplication.
        ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.



CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

ENDCLASS.



CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
