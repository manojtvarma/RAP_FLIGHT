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
      CustomerId,
      CustomerName,
      CarrierId,
      CarrierName,
      ConnectionId,
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _BookSuppl : redirected to composition child ZMV_C_BookSuppl,
      _Travel    : redirected to parent ZMV_C_Travel,
      _BookingCustomerContactCard
}
