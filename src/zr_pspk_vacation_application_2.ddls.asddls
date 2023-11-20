@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Application, App 2'
define root view entity ZR_PSPK_Vacation_Application_2 as select from zpspk_vac_app_db
//composition of target_data_source_name as _association_name
{
    
    @EndUserText: {label: 'Vacation Application Id', quickInfo: 'Vacation Application Id'}
    key id as VacationApplicationId,
    
    @EndUserText: {label: 'Vacation Applicant Id', quickInfo: 'Vacation Applicant Id'}
    vac_app_applicant as VacAppApplicant,
    
    @EndUserText: {label: 'Vacation Authorizer Id', quickInfo: 'Vacation Authorizer Id'}
    vac_app_authorizer as VacAppAuthorizer,
    
    vac_app_start_date as VacAppStartDate,
    vac_app_end_date as VacAppEndDate,
    vac_app_comment as VacAppComment,
    vac_app_status as VacAppStatus,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt
    //_association_name // Make association public
}
