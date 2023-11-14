@EndUserText.label: 'Vacation Application'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PSPK_VACATION_APPLICATION as projection on ZR_PSPK_VACATION_APPLICATION
{
    key VacationApplicationId,
    VacAppApplicant,
    VacAppAuthorizer,
    VacAppStartDate,
    VacAppEndDate,
    VacAppComment,
    VacAppStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Employee : redirected to parent ZC_PSPK_Employee
}
