/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-01-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger PriceMarginTrigger on PriceMargin__c (before insert) {
        PriceMarginTriggerHandler handler = new  PriceMarginTriggerHandler(
            Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap
        );

    switch on Trigger.operationType {
        when  BEFORE_INSERT{
         handler.beforeInsert();   
        } 
    }

}