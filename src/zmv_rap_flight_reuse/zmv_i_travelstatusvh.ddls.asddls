@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Travel Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}
/*Make Travel Status as Dropdown*/
@ObjectModel.resultSet.sizeCategory: #XS

/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZMV_I_TravelStatusVH
  as select from I_DomainFixedValueText
{

      /*Dropdown show Status Description instead of value*/
      @ObjectModel.text.element: [ 'Description' ]
      @EndUserText.label: 'Status'
  key DomainValue as Status,
      @EndUserText.label: 'Description'
      DomainText  as Description
}
where
  SAPDataDictionaryDomain = '/DMO/STATUS'
