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
  association [1] to /DMO/I_Agency        as _Agency       on $projection.AgencyId = _Agency.AgencyID
  association [1] to /DMO/I_Customer      as _Customer     on $projection.CustomerId = _Customer.CustomerID
  association [1] to ZMV_I_TravelStatusVH as _TravelStatus on $projection.Status = _TravelStatus.Status
{
  key travel_id                                                       as TravelId,
      agency_id                                                       as AgencyId,
      _Agency.Name                                                    as AgencyName,
      customer_id                                                     as CustomerId,
      @EndUserText.label: 'Customer'
      concat_with_space( _Customer.FirstName, _Customer.LastName, 1 ) as CustomerName,
      begin_date                                                      as BeginDate,
      end_date                                                        as EndDate,
      booking_fee                                                     as BookingFee,
      total_price                                                     as TotalPrice,
      currency_code                                                   as CurrencyCode,
      description                                                     as Description,
      status                                                          as Status,
      _TravelStatus.Description                                       as TravelStatusDescription,

      @EndUserText.label: 'Created By'
      @Semantics.user.createdBy: true
      createdby                                                       as CreatedBy,

      @EndUserText.label: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      createdat                                                       as CreatedAt,

      @EndUserText.label: 'Last Changed By'
      @Semantics.user.lastChangedBy: true
      lastchangedby                                                   as LastChangedBy,

      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat                                                   as LastChangedAt,

      /* Associations */
      _Agency,
      _Customer,
      _TravelStatus

}
