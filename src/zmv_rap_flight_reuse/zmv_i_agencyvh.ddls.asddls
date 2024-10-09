@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Agency ID'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZMV_I_AgencyVH
  as select from /DMO/I_Agency
{


  key AgencyID,
      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.7   }
      Name
}
