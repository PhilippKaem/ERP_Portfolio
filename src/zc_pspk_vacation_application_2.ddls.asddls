@EndUserText.label: 'Vacation Application, App 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_PSPK_Vacation_Application_2 as projection on ZR_PSPK_Vacation_Application_2
{
    key VacationApplicationId,
    VacAppApplicant,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PSPK_AuthorizerVH', element: 'EmployeeId' }}]
    VacAppAuthorizer,
    
    VacAppStartDate,
    VacAppEndDate,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    VacAppComment,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PSPK_StatusVH', element: 'Status' } }]
    VacAppStatus,
    
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt
}
