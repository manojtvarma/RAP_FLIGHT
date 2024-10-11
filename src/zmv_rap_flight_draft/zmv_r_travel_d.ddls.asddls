@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP View: Travel'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZMV_R_Travel_D
  as select from ZMV_I_Travel
  composition [1..*] of ZMV_R_Booking_D as _Booking
{
  key TravelId,
      AgencyId,
      AgencyName,
      CustomerId,
      CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      TravelStatusDescription,
      TravelStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Booking,
      _Agency,
      _CustomerContactCard,
      _TravelStatus
}
