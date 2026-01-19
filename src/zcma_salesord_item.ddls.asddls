@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item projection view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType                       : #CONSUMPTION
@Metadata.allowExtensions           : true
@Search.searchable                  : true
define view entity ZCMA_SALESORD_ITEM 
as projection on ZIMA_SALESORD_ITEM
{
    key Salesorder,
    key Salesorderitem,
    Material,
    Plant,
    @Semantics.quantity.unitOfMeasure : 'orderquantityunit'
    Orderquantity,
    Orderquantityunit,
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
    _head : redirected to parent ZCMA_SALESORD_HEAD
}
