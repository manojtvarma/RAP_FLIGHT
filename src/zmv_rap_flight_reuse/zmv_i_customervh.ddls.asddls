@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}
@Search.searchable: true
define view entity ZMV_I_CustomerVH
  as select from /DMO/I_Customer
{
  key CustomerID,

      @Search: { defaultSearchElement: true,
                fuzzinessThreshold: 0.7   }

      FirstName,

      @Search: { defaultSearchElement: true,
                fuzzinessThreshold: 0.7   }
      LastName

      //      @EndUserText.label: 'Name'
      //      concat_with_space( FirstName, LastName, 1 ) as Name
}
