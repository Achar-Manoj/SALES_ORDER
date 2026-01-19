@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIMA_SALESORD_ITEM_BASE as select from ztma_salesord_it
{
    key salesorder as Salesorder,
    key salesorderitem as Salesorderitem,
    material as Material,
    plant as Plant,
    @Semantics.quantity.unitOfMeasure : 'orderquantityunit'
    orderquantity as Orderquantity,
    orderquantityunit as Orderquantityunit,
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
