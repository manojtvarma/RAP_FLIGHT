@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMV_C_Booking_M
  as projection on ZMV_R_Booking_M
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
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _BookSuppl : redirected to composition child ZMV_C_BookSuppl_M,
      _Carrier,
      _BookingCustomerContactCard,
      _Travel    : redirected to parent ZMV_C_Travel_M
}
