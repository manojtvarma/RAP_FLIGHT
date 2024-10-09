@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Travel'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_I_Travel
  as select from /dmo/travel
  association [1] to /DMO/I_Agency             as _Agency              on $projection.AgencyId = _Agency.AgencyID
  association [1] to ZMV_I_CustomerContactCard as _CustomerContactCard on $projection.CustomerId = _CustomerContactCard.CustomerID
  association [1] to ZMV_I_TravelStatusVH      as _TravelStatus        on $projection.Status = _TravelStatus.Status
{
  key travel_id                         as TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id                         as AgencyId,
      _Agency.Name                      as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id                       as CustomerId,
      _CustomerContactCard.CustomerName as CustomerName,

      begin_date                        as BeginDate,
      end_date                          as EndDate,
      booking_fee                       as BookingFee,
      total_price                       as TotalPrice,
      currency_code                     as CurrencyCode,
      description                       as Description,

      @ObjectModel.text.element: [ 'TravelStatusDescription' ]
      status                            as Status,
      _TravelStatus.Description         as TravelStatusDescription,

      case status
       when 'B' then 3 //Success
       when 'N' then 2 //Warning
       when 'X' then 1 //Error
       else 0          //Neutral
      end                               as TravelStatusCriticality,

      @EndUserText.label: 'Created By'
      @Semantics.user.createdBy: true
      createdby                         as CreatedBy,

      @EndUserText.label: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      createdat                         as CreatedAt,

      @EndUserText.label: 'Last Changed By'
      @Semantics.user.lastChangedBy: true
      lastchangedby                     as LastChangedBy,

      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat                     as LastChangedAt,

      /* Associations */
      _Agency,
      _CustomerContactCard,
      _TravelStatus

}
