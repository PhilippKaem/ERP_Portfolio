
@EndUserText.label: 'Vacation Entitlement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_PSPK_Vacation_Entitlement as projection on ZR_PSPK_Vacation_Entitlement
{
    key VaciationEntitlementId,
    VacEntEmployee,
    VacEntYear,
    VacVacationDays,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Associations */
    _Employee : redirected to parent ZC_PSPK_Employee
    
}
