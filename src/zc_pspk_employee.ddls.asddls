@EndUserText.label: 'Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_PSPK_Employee
  as projection on ZR_PSPK_Employee
{
  key EmployeeId,
      EmpEmployeeNumber,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      EmpFirstName,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      EmpLastName,

      EmpEntranceDate,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data */
      VacVacationDays,
      VacAppPlannedVacDaysB,
      VacAppPlannedVacDaysG,

      /* Associations */
      _VacationEntitlements : redirected to composition child ZC_PSPK_Vacation_Entitlement,
      _VacationApplications : redirected to composition child ZC_PSPK_Vacation_Application

}
