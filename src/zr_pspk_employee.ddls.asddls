@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_PSPK_Employee as select from zpspk_emp_db
 composition [0..*] of ZR_PSPK_Vacation_Entitlement as _VacationEntitlements
 composition [0..*] of ZR_PSPK_Vacation_Application as _VacationApplications
 association [1..1] to ZR_PSPK_VACATION_APP_SUM_B as _VAC_APP_SUM_B on $projection.EmployeeId = _VAC_APP_SUM_B.VacAppApplicant
 association [1..1] to ZR_PSPK_VACATION_APP_SUM_G as _VAC_APP_SUM_G on $projection.EmployeeId = _VAC_APP_SUM_G.VacAppApplicant
 association [1..1] to ZR_PSPK_VACATION_ENT_SUM as _VAC_ENT_SUM on $projection.EmployeeId = _VAC_ENT_SUM.VacEntEmployee
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
    _VacationApplications,
    
    @EndUserText: {label: 'Planned Vacation Days', quickInfo: 'Planned Vacation Days'}
    _VAC_APP_SUM_B.VacAppPlannedVacDaysB as VacAppPlannedVacDaysB,
    
    @EndUserText: {label: 'Approved Vacation Days', quickInfo: 'Approved Vacation Days'}
    _VAC_APP_SUM_G.VacAppPlannedVacDaysG as VacAppPlannedVacDaysG,
    
    @EndUserText: {label: 'Sum of All Vacation Entitlement Days', quickInfo: 'Sum of All Vacation Entitlements (days)'}
    _VAC_ENT_SUM.VacVacationDays as VacVacationDays
}
