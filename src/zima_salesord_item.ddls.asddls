@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZIMA_SALESORD_ITEM 
as select from ZIMA_SALESORD_ITEM_BASE as item
association to parent ZIMA_SALESORD_HEAD as _head
    on $projection.Salesorder = _head.Salesorder
{
    key item.Salesorder,
    key item.Salesorderitem,
    item.Material,
    item.Plant,
    @Semantics.quantity.unitOfMeasure : 'orderquantityunit'
    item.Orderquantity,
    item.Orderquantityunit,
    @Semantics.amount.currencyCode : 'currencycode'
    item.Netamount,
    item.Currencycode,

    @Semantics.systemDateTime.createdAt: true
    item.Creationdate,
    @Semantics.user.createdBy: true
    item.Createdbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    item.Changeddate,
    @Semantics.user.lastChangedBy: true
    item.Changedbyuser,
    
    localchangeddate,
    
    _head // Make association public
}
