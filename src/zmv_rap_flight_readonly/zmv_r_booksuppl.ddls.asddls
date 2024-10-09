@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP View: Booking Supplement'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_R_BookSuppl
  as select from ZMV_I_BookSuppl
  association to parent ZMV_R_Booking as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                  and $projection.BookingId = _Booking.BookingId
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      
      /* Associations */
      _Booking
}
