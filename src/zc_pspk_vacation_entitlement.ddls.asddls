@EndUserText.label: 'Vacation Entitlement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PSPK_Vacation_Entitlement
  as projection on ZR_PSPK_Vacation_Entitlement
{
  key VaciationEntitlementId,

      @ObjectModel.text.element: [ 'VacEntEmployeeName' ]
      VacEntEmployee,
      
      VacEntYear,
      VacVacationDays,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data */
      VacEntEmployeeName,

      /* Associations */
      _Employee : redirected to parent ZC_PSPK_Employee

}
