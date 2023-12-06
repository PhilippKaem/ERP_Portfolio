@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Vacation Applicant'
define view entity ZI_PSPK_VacAuthorizerText
  as select from zpspk_emp_db
{
  key  id                                                   as VacationAuthorizerId,
       concat_with_space(emp_first_name, emp_last_name , 1) as AuthorizerName
}
