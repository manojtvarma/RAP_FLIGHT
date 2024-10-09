@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_R_Booking
  as select from ZMV_I_Booking as _Booking
  association to parent ZMV_R_Travel    as _Travel on $projection.TravelId = _Travel.TravelId
  composition [1..*] of ZMV_R_BookSuppl as _BookSuppl
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
      _Booking._CustomerContactCard as _BookingCustomerContactCard

}
