/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-06-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OrderTrigger on Order (after update) {

    OrderTriggerHandler handler = new OrderTriggerHandler(
        Trigger.old, Trigger.new,Trigger.oldMap,Trigger.newMap
    );

    switch on Trigger.operationType {
        when AFTER_UPDATE{
            handler.afterUpdate();
        }
    }

}