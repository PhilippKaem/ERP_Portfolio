@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Application, App 2'
define root view entity ZR_PSPK_Vacation_Application_2
  as select from zpspk_vac_app_db
  association [1..1] to ZI_PSPK_VacApplicantText  as _VacApplicantText  on $projection.VacAppApplicant = _VacApplicantText.VacationApplicantId
  association [1..1] to ZI_PSPK_VacAuthorizerText as _VacAuthorizerText on $projection.VacAppAuthorizer = _VacAuthorizerText.VacationAuthorizerId
  association [1..1] to ZI_PSPK_StatusText        as _StatusText        on $projection.VacationApplicationId = _StatusText.VacationApplicationID
{
      @EndUserText: {label: 'Vacation Application Id', quickInfo: 'Vacation Application Id'}
  key id                                as VacationApplicationId,

      @EndUserText: {label: 'Vacation Applicant', quickInfo: 'Vacation Applicant'}
      vac_app_applicant                 as VacAppApplicant,

      @EndUserText: {label: 'Vacation Authorizer', quickInfo: 'Vacation Authorizer'}
      vac_app_authorizer                as VacAppAuthorizer,

      vac_app_start_date                as VacAppStartDate,
      vac_app_end_date                  as VacAppEndDate,
      vac_app_comment                   as VacAppComment,

      @ObjectModel.text.element: [ 'StatusName' ]
      vac_app_status                    as VacAppStatus,

      @EndUserText: {label: 'Vacation Days', quickInfo: 'Vacation Days'}
      vac_app_planned_vac_days          as VacAppVacDays,

      @Semantics.user.createdBy: true
      created_by                        as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      created_at                        as CreatedAt,

      @Semantics.user.lastChangedBy: true
      last_changed_by                   as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                   as LastChangedAt,

      /* Transient Data */
      @EndUserText: {label: 'Vacation Applicant Name', quickInfo: 'Vacation Applicant Name'}
      _VacApplicantText.ApplicantName   as ApplicantName,
      _VacAuthorizerText.AuthorizerName as AuthorizerName,

      case when vac_app_status = 'G' then _StatusText.StatusNameG
          when vac_app_status = 'B' then _StatusText.StatusNameB
          when vac_app_status = 'A' then _StatusText.StatusNameA
          else null
          end                           as StatusName,

      case when vac_app_status = 'G' then 3
          when vac_app_status = 'B' then 2
          when vac_app_status = 'A' then 1
          else 0
          end                           as StatusCriticality
}
