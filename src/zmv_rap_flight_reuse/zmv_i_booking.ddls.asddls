@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Booking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_I_Booking
  as select from /dmo/booking
  association [1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1] to /DMO/I_Carrier  as _Carrier  on $projection.CarrierId = _Carrier.AirlineID
{
  key travel_id                                                       as TravelId,
  key booking_id                                                      as BookingId,
      booking_date                                                    as BookingDate,
      customer_id                                                     as CustomerId,
      @EndUserText.label: 'Customer'
      concat_with_space( _Customer.FirstName, _Customer.LastName, 1 ) as CustomerName,
      carrier_id                                                      as CarrierId,
      _Carrier.Name                                                   as CarrierName,
      connection_id                                                   as ConnectionId,
      flight_date                                                     as FlightDate,
      flight_price                                                    as FlightPrice,
      currency_code                                                   as CurrencyCode,

      /* Associations */
      _Customer,
      _Carrier
}
