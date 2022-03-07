/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-07-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OrderHelper {
    public OrderHelper() {}

    public static List<OrderItem> checkRecalcItems(Map<Id,Order> oldRecords, Map<Id,Order> newRecords){
        Set<Id> orderIds = new Set<Id>();
        
        for(Order order : newRecords.values()){
            Order oldRecord = oldRecords.get(order.Id);

            if(order.DistributionCenter__c != oldRecord.DistributionCenter__c){
                orderIds.add(order.Id);
            }
        }

        List<OrderItem> orderItemList = [
        SELECT Id, ListPrice, Product2Id, OrderId
        FROM OrderItem
        WHERE OrderId IN: orderIds
        ];

        System.debug('OrderTriggerHandler - orderItemList'+ orderItemList);

        List<OrderItem> updatedOrderItemList  = OrderItemHelper.calcPrice(orderItemList);

        System.debug('updatedOrderItemList - orderItemList'+ updatedOrderItemList);
        return updatedOrderItemList;
        
    }

}
