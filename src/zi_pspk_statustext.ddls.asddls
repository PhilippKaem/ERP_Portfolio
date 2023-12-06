@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Status'
define view entity ZI_PSPK_StatusText
  as select from zpspk_vac_app_db
{
  key id             as VacationApplicationID,
      vac_app_status as VacAppStatus,

      'Declined'     as StatusNameA,
      'Requested'    as StatusNameB,
      'Approved'     as StatusNameG
}
