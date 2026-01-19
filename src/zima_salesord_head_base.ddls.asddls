@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZIMA_SALESORD_HEAD_BASE as select from ztma_salesord_hd
{
    key salesorder as Salesorder,
    salesordertype as Salesordertype,
    salesorganization as Salesorganization,
    distributionchannel as Distributionchannel,
    division as Division,
    soldtoparty as Soldtoparty,
    @Semantics.amount.currencyCode : 'currencycode'
    netamount as Netamount,
    currencycode as Currencycode,
    
    @Semantics.systemDateTime.createdAt: true
    creationdate as Creationdate,
    @Semantics.user.createdBy: true
    createdbyuser as Createdbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    changeddate as Changeddate,
    @Semantics.user.lastChangedBy: true
    changedbyuser as Changedbyuser,
    
    localchangeddate
}
