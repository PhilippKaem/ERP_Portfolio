@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Application Sum'
define view entity ZR_PSPK_VACATION_APP_SUM
  as select from zpspk_vac_app_db
{
  key id                            as VacAppSumId,
      vac_app_applicant             as VacAppApplicant,
      vac_app_status                as VacAppStatus,
      sum(vac_app_planned_vac_days) as VacAppPlannedVacDays
}
where
  vac_app_status = 'G'
group by
  id,
  vac_app_applicant,
  vac_app_status
