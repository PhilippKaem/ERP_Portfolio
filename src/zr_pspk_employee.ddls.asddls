@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_PSPK_Employee as select from zpspk_emp_db
//composition of target_data_source_name as _association_name
{
    key id as Id,
    emp_employee_number as EmpEmployeeNumber,
    emp_first_name as EmpFirstName,
    emp_last_name as EmpLastName,
    emp_entrance_date as EmpEntranceDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt
    //_association_name // Make association public
}
