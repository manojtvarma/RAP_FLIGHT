@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZMV_C_Travel
  provider contract transactional_query
  as projection on ZMV_R_Travel
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      CustomerName,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,

      Description,
      @ObjectModel.text.element: [ 'TravelStatusDescription' ]
      Status,
      TravelStatusDescription,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZMV_C_Booking
}
