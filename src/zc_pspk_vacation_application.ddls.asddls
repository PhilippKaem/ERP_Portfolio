@EndUserText.label: 'Vacation Application'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PSPK_Vacation_Application as projection on ZR_PSPK_Vacation_Application
{
    key VacationApplicationId,
    @ObjectModel.text.element: [ 'ApplicantName' ]
    VacAppApplicant,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PSPK_AuthorizerVH', element: 'EmployeeId' }}]
    @ObjectModel.text.element: [ 'AuthorizerName' ]
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
    
    /* Transient Data */
    ApplicantName,
    AuthorizerName,
    StatusCriticality,
    
    /* Associations */
    _Employee : redirected to parent ZC_PSPK_Employee
}
