@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMV_C_Booking_D
  as projection on ZMV_R_Booking_D
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
      _BookSuppl : redirected to composition child ZMV_C_BookSuppl_D,
      _Carrier,
      _BookingCustomerContactCard,
      _Travel    : redirected to parent ZMV_C_Travel_D
}
