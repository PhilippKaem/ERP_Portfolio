CLASS lhc_vacationapplication DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineVacationApplicationID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationApplication~DetermineVacationApplicationID.
*    METHODS DetermineVacationApplicantID FOR DETERMINE ON MODIFY
*      IMPORTING keys FOR VacationApplication~DetermineVacationApplicantID.

ENDCLASS.



CLASS lhc_vacationapplication IMPLEMENTATION.

  METHOD DetermineVacationApplicationID.

    " Read Vacation Applications
    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
         FIELDS ( VacationApplicationId )
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


*  METHOD DetermineVacationApplicantID.
*
*    " Read Vacation Applicants
*    READ ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
*         FIELDS ( VacAppApplicant )
*         WITH CORRESPONDING #( keys )
*         RESULT DATA(vacationApplicants).
*
*    " Process Vacation Applications
*    LOOP AT vacationApplicants REFERENCE INTO DATA(vacationApplicant).
*
*      " Set Vacation Application ID
*      SELECT FROM zpspk_vac_app_db FIELDS MAX( vac_app_applicant ) INTO @DATA(max_vacation_applicant_id).
*      vacationapplicant->VacAppApplicant = max_vacation_applicant_id + 1.
*
*    ENDLOOP.
*
*    " Modify Vacation Applications
*    MODIFY ENTITY IN LOCAL MODE ZR_PSPK_Vacation_Application
*           UPDATE FIELDS ( VacAppApplicant )
*           WITH VALUE #( FOR v IN vacationapplicants
*                         ( %tky     = vacationapplicant->%tky
*                           VacAppApplicant = vacationapplicant->VacAppApplicant ) ).
*
*  ENDMETHOD.


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
