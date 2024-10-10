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
  association [1] to ZMV_I_CustomerContactCard as _CustomerContactCard on $projection.CustomerId = _CustomerContactCard.CustomerID
  association [1] to /DMO/I_Carrier            as _Carrier             on $projection.CarrierId = _Carrier.AirlineID
{
  key travel_id                         as TravelId,
  key booking_id                        as BookingId,
      booking_date                      as BookingDate,

      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id                       as CustomerId,
      @EndUserText.label: 'Customer'
      _CustomerContactCard.CustomerName as CustomerName,

      @ObjectModel.text.element: [ 'CarrierName' ]
      carrier_id                        as CarrierId,
      _Carrier.Name                     as CarrierName,
      connection_id                     as ConnectionId,
      flight_date                       as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price                      as FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      currency_code                     as CurrencyCode,

      /* Associations */
      _CustomerContactCard,
      _Carrier
}
