@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMV_C_Booking
  as projection on ZMV_R_Booking
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _BookSuppl,
      _Travel : redirected to parent ZMV_C_Travel
}
