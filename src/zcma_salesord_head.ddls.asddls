@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header projection view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType                       : #CONSUMPTION
@Metadata.allowExtensions           : true
@Search.searchable                  : true
define root view entity ZCMA_SALESORD_HEAD 
provider contract transactional_query
as projection on ZIMA_SALESORD_HEAD
{
    key Salesorder,
    Salesordertype,
    Salesorganization,
    Distributionchannel,
    Division,
    Soldtoparty,
    @Semantics.amount.currencyCode : 'currencycode'
    Netamount,
    Currencycode,
    
    @Semantics.systemDateTime.createdAt: true
    Creationdate,
    @Semantics.user.createdBy: true
    Createdbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    Changeddate,
    @Semantics.user.lastChangedBy: true
    Changedbyuser,
    
    localchangeddate,
    
    /* Associations */
    _item : redirected to composition child ZCMA_SALESORD_ITEM
}
