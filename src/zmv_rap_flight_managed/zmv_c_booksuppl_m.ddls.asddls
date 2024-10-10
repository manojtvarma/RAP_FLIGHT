@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Booking Supplement'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMV_C_BookSuppl_M
  as projection on ZMV_R_BookSuppl_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      SupplementDescription,
      Price,
      CurrencyCode,

      /* Associations */
      _Travel  : redirected to ZMV_C_Travel_M,
      _Booking : redirected to parent ZMV_C_Booking_M,
      _Supplement
}
