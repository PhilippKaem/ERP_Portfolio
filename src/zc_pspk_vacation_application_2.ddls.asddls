@EndUserText.label: 'Vacation Application, App 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_PSPK_Vacation_Application_2 as projection on ZR_PSPK_VACATION_APPLICATION_2
{
    key VacationApplicationId,
    VacAppApplicant,
    VacAppAuthorizer,
    VacAppStartDate,
    VacAppEndDate,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    VacAppComment,
    VacAppStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt
}
