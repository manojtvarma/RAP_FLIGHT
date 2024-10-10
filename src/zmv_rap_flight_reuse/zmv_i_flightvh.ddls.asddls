@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Flight'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZMV_I_FlightVH
  as select from /DMO/I_Connection
{
  key AirlineID,
  key ConnectionID,
      DepartureAirport,
      DestinationAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      @EndUserText.label: 'Distance Unit'
      DistanceUnit
}
