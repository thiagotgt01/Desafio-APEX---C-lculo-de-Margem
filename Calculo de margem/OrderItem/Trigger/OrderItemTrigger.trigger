/**
 * @description       : Sumariazação de dados
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-01-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OrderItemTrigger on OrderItem (before insert) {

    OrderItemTriggerHandler handler = new OrderItemTriggerHandler(
        Trigger.old, Trigger.new,Trigger.oldMap,Trigger.newMap
    );

    switch on Trigger.operationType {
        when  BEFORE_INSERT {
    handler.beforeInsert();
        }
        
    }

} 