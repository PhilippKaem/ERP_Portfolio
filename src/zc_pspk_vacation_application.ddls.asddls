@EndUserText.label: 'Vacation Application'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PSPK_Vacation_Application as projection on ZR_PSPK_Vacation_Application
{
    key VacationApplicationId,
    VacAppApplicant,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PSPK_AuthorizerVH', element: 'EmployeeId' }}]
    VacAppAuthorizer,
    
    VacAppStartDate,
    VacAppEndDate,
    VacAppComment,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PSPK_StatusVH', element: 'Status' } }]
    VacAppStatus,
    
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Associations */
    _Employee : redirected to parent ZC_PSPK_Employee
}
