@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
define view entity ZR_PSPK_Vacation_Entitlement as select from zpspk_vac_ent_db
association to parent ZR_PSPK_Employee as _Employee
    on $projection.VacEntEmployee = _Employee.EmployeeId
    association [1..1] to ZI_PSPK_VacEntEmployeeText as _VacEntEmployeeText on $projection.VacEntEmployee = _VacEntEmployeeText.VacationEntEmployeeId
{

    @EndUserText: {label: 'Vaciation Entitlement Id', quickInfo: 'Vaciation Entitlement Id'}
    key id as VaciationEntitlementId,
    
    vac_ent_employee as VacEntEmployee,
    vac_ent_year as VacEntYear,
    vac_vacation_days as VacVacationDays,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    /* Transient Data */
    _VacEntEmployeeText.VacEntEmployeeName as VacEntEmployeeName,
    
    /* Associations */
    _Employee // Make association public
}
