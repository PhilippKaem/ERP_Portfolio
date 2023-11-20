CLASS zcl_pspk_test_data_generator DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_pspk_test_data_generator IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

  DATA employees TYPE TABLE OF ZPSPK_EMP_DB.
  DATA employee type ZPSPK_EMP_DB.

  DATA vacation_Entitlements TYPE TABLE OF zpspk_vac_ent_db.
  DATA vacation_Entitlement type zpspk_vac_ent_db.

  DATA vacation_Applications TYPE TABLE OF zpspk_vac_app_db.
  DATA vacation_Application type zpspk_vac_app_db.

  DELETE FROM ZPSPK_EMP_DB.
  DELETE FROM zpspk_vac_ent_db.
  DELETE FROM zpspk_vac_app_db.

  employee-emp_employee_number = 1.
  employee-emp_first_name = 'Hans'.
  employee-emp_last_name = 'Maier'.
  employee-emp_entrance_date = '20000501'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = 1.
  append employee TO employees.

  vacation_entitlement-client = sy-mandt.
  get time STAMP FIELD vacation_entitlement-created_at.
  get time STAMP FIELD vacation_entitlement-last_changed_at.
  vacation_entitlement-created_by = 'PS'.
  vacation_entitlement-last_changed_by = 'PS'.
  vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
  vacation_entitlement-vac_ent_year = 2022.
  vacation_entitlement-vac_vacation_days = 30.
  vacation_entitlement-vac_ent_employee = employee-id.
  append vacation_entitlement TO vacation_entitlements.

  vacation_entitlement-client = sy-mandt.
  get time STAMP FIELD vacation_entitlement-created_at.
  get time STAMP FIELD vacation_entitlement-last_changed_at.
  vacation_entitlement-created_by = 'PS'.
  vacation_entitlement-last_changed_by = 'PS'.
  vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
  vacation_entitlement-vac_ent_year = 2023.
  vacation_entitlement-vac_vacation_days = 30.
  vacation_entitlement-vac_ent_employee = employee-id.
  append vacation_entitlement TO vacation_entitlements.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = employee-id.
  vacation_application-vac_app_authorizer = 2.
  vacation_application-vac_app_comment = 'Sommerurlaub'.
  vacation_application-vac_app_end_date = '20220710'.
  vacation_application-vac_app_start_date = '20220701'.
  vacation_application-vac_app_status = 'G'.
  APPEND vacation_application to vacation_applications.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = employee-id.
  vacation_application-vac_app_authorizer = 2.
  vacation_application-vac_app_comment = 'Weihnachtsurlaub'.
  vacation_application-vac_app_end_date = '20221230'.
  vacation_application-vac_app_start_date = '20221227'.
  vacation_application-vac_app_status = 'A'.
  APPEND vacation_application to vacation_applications.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = employee-id.
  vacation_application-vac_app_authorizer = 2.
  vacation_application-vac_app_comment = 'Weihnachtsurlaub (2. Versuch)'.
  vacation_application-vac_app_end_date = '20221230'.
  vacation_application-vac_app_start_date = '20221228'.
  vacation_application-vac_app_status = 'G'.
  APPEND vacation_application to vacation_applications.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = employee-id.
  vacation_application-vac_app_authorizer = 2.
  vacation_application-vac_app_comment = ''.
  vacation_application-vac_app_end_date = '20230614'.
  vacation_application-vac_app_start_date = '20230527'.
  vacation_application-vac_app_status = 'G'.
  APPEND vacation_application to vacation_applications.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = employee-id.
  vacation_application-vac_app_authorizer = 2.
  vacation_application-vac_app_comment = 'Winterurlaub'.
  vacation_application-vac_app_end_date = '20231231'.
  vacation_application-vac_app_start_date = '20231220'.
  vacation_application-vac_app_status = 'B'.
  APPEND vacation_application to vacation_applications.

  vacation_application-client = sy-mandt.
  get time STAMP FIELD vacation_application-created_at.
  vacation_application-created_by = 'PK'.
  vacation_application-id = cl_system_uuid=>create_uuid_x16_static( ).
  get time STAMP FIELD vacation_application-last_changed_at.
  vacation_application-last_changed_by = 'PK'.
  vacation_application-vac_app_applicant = 'Petra Schmid'.
  vacation_application-vac_app_authorizer = 1.
  vacation_application-vac_app_comment = 'Weihnachtsurlaub'.
  vacation_application-vac_app_end_date = '20231231'.
  vacation_application-vac_app_start_date = '20231227'.
  vacation_application-vac_app_status = 'B'.
  APPEND vacation_application to vacation_applications.


  employee-emp_employee_number = 2.
  employee-emp_first_name = 'Lisa'.
  employee-emp_last_name = 'Müller'.
  employee-emp_entrance_date = '20100701'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = 2.
  append employee TO employees.

  vacation_entitlement-client = sy-mandt.
  get time STAMP FIELD vacation_entitlement-created_at.
  get time STAMP FIELD vacation_entitlement-last_changed_at.
  vacation_entitlement-created_by = 'PS'.
  vacation_entitlement-last_changed_by = 'PS'.
  vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
  vacation_entitlement-vac_ent_year = 2023.
  vacation_entitlement-vac_vacation_days = 30.
  vacation_entitlement-vac_ent_employee = employee-id.
  append vacation_entitlement TO vacation_entitlements.


  employee-emp_employee_number = 3.
  employee-emp_first_name = 'Petra'.
  employee-emp_last_name = 'Schmid'.
  employee-emp_entrance_date = '20221001'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = 3.
  append employee TO employees.

  vacation_entitlement-client = sy-mandt.
  get time STAMP FIELD vacation_entitlement-created_at.
  get time STAMP FIELD vacation_entitlement-last_changed_at.
  vacation_entitlement-created_by = 'PS'.
  vacation_entitlement-last_changed_by = 'PS'.
  vacation_entitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
  vacation_entitlement-vac_ent_year = 2023.
  vacation_entitlement-vac_vacation_days = 7.
  vacation_entitlement-vac_ent_employee = employee-id.
  append vacation_entitlement TO vacation_entitlements.


  INSERT ZPSPK_EMP_DB FROM TABLE @employees.
  INSERT zpspk_vac_ent_db FROM TABLE @vacation_entitlements.
  INSERT zpspk_vac_app_db FROM TABLE @vacation_applications.

  ENDMETHOD.
ENDCLASS.
