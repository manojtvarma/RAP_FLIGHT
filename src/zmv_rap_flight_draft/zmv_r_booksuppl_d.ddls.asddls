@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP View: Booking Supplement'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_R_BookSuppl_D
  as select from ZMV_I_BookSuppl
  association     to parent ZMV_R_Booking_D as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                        and $projection.BookingId = _Booking.BookingId
  association [1] to ZMV_R_Travel_D         as _Travel  on  $projection.TravelId = _Travel.TravelId
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      SupplementDescription,
      Price,
      CurrencyCode,

      /* Associations */
      _Travel,
      _Booking,
      _Supplement
}
