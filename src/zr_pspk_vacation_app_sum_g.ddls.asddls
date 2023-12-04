@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Application Sum G'

define view entity ZR_PSPK_VACATION_APP_SUM_G as select from zpspk_vac_app_db
{
    key vac_app_applicant as VacAppApplicant,
    sum(vac_app_planned_vac_days) as VacAppPlannedVacDaysG
}
where
    vac_app_status = 'G'
group by
    vac_app_applicant
