@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Customer Contact Card'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMV_I_CustomerContactCard
  as select from /DMO/I_Customer
{
  key CustomerID,
      FirstName,
      LastName,

      @Semantics.name.fullName: true
      @EndUserText.label: 'Customer'
      concat_with_space( FirstName, LastName, 1 ) as CustomerName,

      @Semantics.address.street: true
      Street,

      @Semantics.address.zipCode: true
      PostalCode,

      @Semantics.address.city: true
      City,

      @Semantics.address.country: true
      CountryCode,

      @Semantics.telephone.type: [ #WORK ]
      PhoneNumber,

      @Semantics.eMail.type: [ #WORK ]
      EMailAddress,
      /* Associations */
      _Country
}
