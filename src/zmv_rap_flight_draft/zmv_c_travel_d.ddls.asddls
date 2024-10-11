@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZMV_C_Travel_D
  provider contract transactional_query
  as projection on ZMV_R_Travel_D
{
  key TravelId,
      AgencyId,
      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      AgencyName,
      CustomerId,
      CustomerName,
      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      _CustomerContactCard.FirstName,

      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      _CustomerContactCard.LastName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      TravelStatusDescription,
      TravelStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Agency,
      _CustomerContactCard,
      _Booking : redirected to composition child ZMV_C_Booking_D,
      _TravelStatus
}
