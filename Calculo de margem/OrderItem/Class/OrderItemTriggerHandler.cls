/**
 * @description       : Sumariazação de dados
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-05-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OrderItemTriggerHandler {
    
    List<OrderItem> oldRecords {get; set;}   //Trigger.new
    List<OrderItem> newRecords {get; set;}   //Trigger.old
    Map<Id,OrderItem> oldMap {get; set;}  //Trigger.oldMap
    Map<Id,OrderItem> newMap {get; set;}  //Trigger.newMap

    public OrderItemTriggerHandler(List<OrderItem> oldRecords, List<OrderItem> newRecords, Map<Id,OrderItem> oldMap, Map<Id,OrderItem> newMap) {
        this.oldRecords = oldRecords;
        this.newRecords = newRecords;

        this.oldMap = oldMap; 
        this.newMap = newMap;
    }

    public void beforeInsert(){
       
        OrderItemHelper.checkError(this.newRecords);
        OrderItemHelper.calcPrice(this.newRecords);
        
    }


}
