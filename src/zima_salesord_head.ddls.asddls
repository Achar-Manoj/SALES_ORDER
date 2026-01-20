@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define root view entity ZIMA_SALESORD_HEAD 
as select from ZIMA_SALESORD_HEAD_BASE as header
composition [1..*] of ZIMA_SALESORD_ITEM as _item
{
    key header.Salesorder,
    header.Salesordertype,
    header.Salesorganization,
    header.Distributionchannel,
    header.Division,
    header.Soldtoparty,
    @Semantics.amount.currencyCode : 'currencycode'
    header.Netamount,
    header.Currencycode,
    @Semantics.systemDateTime.createdAt: true
    header.Creationdate,
    @Semantics.user.createdBy: true
    header.Createdbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    header.Changeddate,
    @Semantics.user.lastChangedBy: true
    header.Changedbyuser,
    
    localchangeddate,
    
    _item // Make association public
}
