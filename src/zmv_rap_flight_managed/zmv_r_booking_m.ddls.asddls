@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_R_Booking_M
  as select from ZMV_I_Booking as _Booking
  association to parent ZMV_R_Travel_M    as _Travel on $projection.TravelId = _Travel.TravelId
  composition [0..*] of ZMV_R_BookSuppl_M as _BookSuppl
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
      _Travel,
      _BookSuppl,
      _Carrier,
      _Booking._CustomerContactCard as _BookingCustomerContactCard
}
