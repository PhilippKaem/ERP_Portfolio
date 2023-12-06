@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement Sum'
define view entity ZR_PSPK_VACATION_ENT_SUM
  as select from zpspk_vac_ent_db
{
  key vac_ent_employee       as VacEntEmployee,
      sum(vac_vacation_days) as VacVacationDays
}
group by
  vac_ent_employee
