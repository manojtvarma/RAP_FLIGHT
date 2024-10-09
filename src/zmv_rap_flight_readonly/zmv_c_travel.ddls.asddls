@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZMV_C_Travel
  provider contract transactional_query
  as projection on ZMV_R_Travel
{
  key TravelId,
      AgencyId,
      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      AgencyName,
      CustomerId,
      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      _CustomerContactCard.FirstName,

      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7 }
      _CustomerContactCard.LastName,

      CustomerName,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
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
      _Booking : redirected to composition child ZMV_C_Booking,
      _CustomerContactCard
}
