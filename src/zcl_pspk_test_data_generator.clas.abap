CLASS zcl_pspk_test_data_generator DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_pspk_test_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA employees TYPE TABLE OF zpspk_emp_db.
    DATA maier TYPE zpspk_emp_db.
    DATA mueller TYPE zpspk_emp_db.
    DATA schmid TYPE zpspk_emp_db.

    DATA vacation_Entitlements TYPE TABLE OF zpspk_vac_ent_db.
    DATA vacation_Entitlement TYPE zpspk_vac_ent_db.

    DATA vacation_Applications TYPE TABLE OF zpspk_vac_app_db.
    DATA vacation_Application TYPE zpspk_vac_app_db.

    DELETE FROM zpspk_emp_db.
    DELETE FROM zpspk_vac_ent_db.
    DELETE FROM zpspk_vac_app_db.

    "employee test data

    maier-emp_employee_number = 1.
    maier-emp_first_name = 'Hans'.
    maier-emp_last_name = 'Maier'.
    maier-emp_entrance_date = '20000501'.
    maier-client = sy-mandt.
    maier-created_by = 'PK'.
    GET TIME STAMP FIELD maier-created_at.
    maier-last_changed_by = 'PK'.
    GET TIME STAMP FIELD maier-last_changed_at.
    maier-id = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND maier TO employees.

    mueller-emp_employee_number = 2.
    mueller-emp_first_name = 'Lisa'.
    mueller-emp_last_name = 'Müller'.
    mueller-emp_entrance_date = '20100701'.
    mueller-client = sy-mandt.
    mueller-created_by = 'PK'.
    GET TIME STAMP FIELD mueller-created_at.
    mueller-last_changed_by = 'PK'.
    GET TIME STAMP FIELD mueller-last_changed_at.
    mueller-id = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND mueller TO employees.

    schmid-emp_employee_number = 3.
    schmid-emp_first_name = 'Petra'.
    schmid-emp_last_name = 'Schmid'.
    schmid-emp_entrance_date = '20221001'.
    schmid-client = sy-mandt.
    schmid-created_by = 'PK'.
    GET TIME STAMP FIELD schmid-created_at.
    schmid-last_changed_by = 'PK'.
    GET TIME STAMP FIELD schmid-last_changed_at.
    schmid-id = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND schmid TO employees.

    "vacation application test data

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = maier-id.
    vacation_application-vac_app_authorizer = mueller-id.
    vacation_application-vac_app_comment = 'Sommerurlaub'.
    vacation_application-vac_app_end_date = '20220710'.
    vacation_application-vac_app_start_date = '20220701'.
    vacation_application-vac_app_status = 'G'.
    vacation_application-vac_app_planned_vac_days = 6.
    APPEND vacation_application TO vacation_applications.

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = maier-id.
    vacation_application-vac_app_authorizer = mueller-id.
    vacation_application-vac_app_comment = 'Weihnachtsurlaub'.
    vacation_application-vac_app_end_date = '20221230'.
    vacation_application-vac_app_start_date = '20221227'.
    vacation_application-vac_app_status = 'A'.
    vacation_application-vac_app_planned_vac_days = 4.
    APPEND vacation_application TO vacation_applications.

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = maier-id.
    vacation_application-vac_app_authorizer = mueller-id.
    vacation_application-vac_app_comment = 'Weihnachtsurlaub (2. Versuch)'.
    vacation_application-vac_app_end_date = '20221230'.
    vacation_application-vac_app_start_date = '20221228'.
    vacation_application-vac_app_status = 'G'.
    vacation_application-vac_app_planned_vac_days = 3.
    APPEND vacation_application TO vacation_applications.

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = maier-id.
    vacation_application-vac_app_authorizer = mueller-id.
    vacation_application-vac_app_comment = ''.
    vacation_application-vac_app_end_date = '20230614'.
    vacation_application-vac_app_start_date = '20230527'.
    vacation_application-vac_app_status = 'G'.
    vacation_application-vac_app_planned_vac_days = 12.
    APPEND vacation_application TO vacation_applications.

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = maier-id.
    vacation_application-vac_app_authorizer = mueller-id.
    vacation_application-vac_app_comment = 'Winterurlaub'.
    vacation_application-vac_app_end_date = '20231231'.
    vacation_application-vac_app_start_date = '20231220'.
    vacation_application-vac_app_status = 'B'.
    vacation_application-vac_app_planned_vac_days = 6.
    APPEND vacation_application TO vacation_applications.

    vacation_application-client = sy-mandt.
    GET TIME STAMP FIELD vacation_application-created_at.
    vacation_application-created_by = 'PK'.
    vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
    GET TIME STAMP FIELD vacation_application-last_changed_at.
    vacation_application-last_changed_by = 'PK'.
    vacation_application-vac_app_applicant = schmid-id.
    vacation_application-vac_app_authorizer = maier-id.
    vacation_application-vac_app_comment = 'Weihnachtsurlaub'.
    vacation_application-vac_app_end_date = '20231231'.
    vacation_application-vac_app_start_date = '20231227'.
    vacation_application-vac_app_status = 'B'.
    vacation_application-vac_app_planned_vac_days = 3.
    APPEND vacation_application TO vacation_applications.

    "vacation entitlement test data

    vacation_entitlement-client = sy-mandt.
    GET TIME STAMP FIELD vacation_entitlement-created_at.
    GET TIME STAMP FIELD vacation_entitlement-last_changed_at.
    vacation_entitlement-created_by = 'PS'.
    vacation_entitlement-last_changed_by = 'PS'.
    vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
    vacation_entitlement-vac_ent_year = 2022.
    vacation_entitlement-vac_vacation_days = 30.
    vacation_entitlement-vac_ent_employee = maier-id.
    APPEND vacation_entitlement TO vacation_entitlements.

    vacation_entitlement-client = sy-mandt.
    GET TIME STAMP FIELD vacation_entitlement-created_at.
    GET TIME STAMP FIELD vacation_entitlement-last_changed_at.
    vacation_entitlement-created_by = 'PS'.
    vacation_entitlement-last_changed_by = 'PS'.
    vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
    vacation_entitlement-vac_ent_year = 2023.
    vacation_entitlement-vac_vacation_days = 30.
    vacation_entitlement-vac_ent_employee = maier-id.
    APPEND vacation_entitlement TO vacation_entitlements.

    vacation_entitlement-client = sy-mandt.
    GET TIME STAMP FIELD vacation_entitlement-created_at.
    GET TIME STAMP FIELD vacation_entitlement-last_changed_at.
    vacation_entitlement-created_by = 'PS'.
    vacation_entitlement-last_changed_by = 'PS'.
    vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
    vacation_entitlement-vac_ent_year = 2023.
    vacation_entitlement-vac_vacation_days = 30.
    vacation_entitlement-vac_ent_employee = mueller-id.
    APPEND vacation_entitlement TO vacation_entitlements.

    vacation_entitlement-client = sy-mandt.
    GET TIME STAMP FIELD vacation_entitlement-created_at.
    GET TIME STAMP FIELD vacation_entitlement-last_changed_at.
    vacation_entitlement-created_by = 'PS'.
    vacation_entitlement-last_changed_by = 'PS'.
    vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
    vacation_entitlement-vac_ent_year = 2023.
    vacation_entitlement-vac_vacation_days = 7.
    vacation_entitlement-vac_ent_employee = schmid-id.
    APPEND vacation_entitlement TO vacation_entitlements.


    INSERT zpspk_emp_db FROM TABLE @employees.
    INSERT zpspk_vac_ent_db FROM TABLE @vacation_entitlements.
    INSERT zpspk_vac_app_db FROM TABLE @vacation_applications.

  ENDMETHOD.
ENDCLASS.
