@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Authorizer'
define view entity ZI_PSPK_AuthorizerVH
  as select from zpspk_emp_db
{
  key id                  as EmployeeId,
      emp_employee_number as EmployeeNumber,
      emp_first_name      as FirstName,
      emp_last_name       as LastName,
      emp_entrance_date   as EntranceDate
}
