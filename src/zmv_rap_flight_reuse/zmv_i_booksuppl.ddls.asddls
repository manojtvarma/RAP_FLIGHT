@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Booking Supplement'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #TRANSACTIONAL
}
define view entity ZMV_I_BookSuppl
  as select from /dmo/book_suppl
  association [1] to /DMO/I_Supplement as _Supplement on $projection.SupplementId = _Supplement.SupplementID
{
  key travel_id                          as TravelId,
  key booking_id                         as BookingId,
  key booking_supplement_id              as BookingSupplementId,

      @EndUserText.label: 'Supplement'
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      supplement_id                      as SupplementId,
      _Supplement._SupplText.Description as SupplementDescription,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                              as Price,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      currency_code                      as CurrencyCode,

      /* Associations */
      _Supplement
}
