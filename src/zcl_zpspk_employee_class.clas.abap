CLASS zcl_zpspk_employee_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZPSPK_EMPLOYEE_CLASS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

  DATA employees TYPE TABLE OF ZPSPK_EMP_DB.
  DATA employee type ZPSPK_EMP_DB.


  DELETE FROM ZPSPK_EMP_DB.

  employee-emp_employee_number = 1.
  employee-emp_first_name = 'Hans'.
  employee-emp_last_name = 'Maier'.
  employee-emp_entrance_date = '20000501'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = '0000001'.
  append employee TO employees.

  employee-emp_employee_number = 2.
  employee-emp_first_name = 'Lisa'.
  employee-emp_last_name = 'Müller'.
  employee-emp_entrance_date = '20100701'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = '0000002'.
  append employee TO employees.

  employee-emp_employee_number = 3.
  employee-emp_first_name = 'Petra'.
  employee-emp_last_name = 'Schmid'.
  employee-emp_entrance_date = '20221001'.
  employee-client = sy-mandt.
  employee-created_by = 'PK'.
  get time STAMP FIELD employee-created_at.
  employee-last_changed_by = 'PK'.
  GET TIME STAMP FIELD employee-last_changed_at.
  employee-id = '0000003'.
  append employee TO employees.

  INSERT ZPSPK_EMP_DB FROM TABLE @employees.

  ENDMETHOD.
ENDCLASS.
