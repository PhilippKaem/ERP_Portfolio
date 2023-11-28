@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_PSPK_Employee as select from zpspk_emp_db
 composition [0..*] of ZR_PSPK_Vacation_Entitlement as _VacationEntitlements
 composition [0..*] of ZR_PSPK_Vacation_Application as _VacationApplications
{

    @EndUserText: {label: 'Employee Id', quickInfo: 'Employee Id'}
    key id as EmployeeId,
    
    emp_employee_number as EmpEmployeeNumber,
    emp_first_name as EmpFirstName,
    emp_last_name as EmpLastName,
    emp_entrance_date as EmpEntranceDate,
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    /* Associations */
    _VacationEntitlements, 
    _VacationApplications
}
