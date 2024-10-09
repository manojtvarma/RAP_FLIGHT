@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Booking Supplement'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #TRANSACTIONAL
}
@Metadata.allowExtensions: true
define view entity ZMV_C_BookSuppl
  as projection on ZMV_R_BookSuppl
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,


      SupplementId,
      SupplementDescription,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      /* Associations */
      _Booking : redirected to parent ZMV_C_Booking
}
