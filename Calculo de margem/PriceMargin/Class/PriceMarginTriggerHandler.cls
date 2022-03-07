/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-01-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PriceMarginTriggerHandler {
    
    List<PriceMargin__c> oldRecords {get; set;}  //Trigger.old
    List<PriceMargin__c> newRecords {get; set;}  //Trigger.new

    Map<Id, PriceMargin__c> oldMap = new Map<Id, PriceMargin__c>();
    Map<Id, PriceMargin__c> newMap = new Map<Id, PriceMargin__c>();

    public PriceMarginTriggerHandler(List<PriceMargin__c> oldRecords, List<PriceMargin__c> newRecords, Map<Id, PriceMargin__c> oldMap, Map<Id, PriceMargin__c> newMap) {
        this.oldRecords = oldRecords;
        this.newRecords = newRecords;
        
        this.oldMap = oldMap;
        this.newMap = newMap;
    }

    public void beforeInsert(){
        PriceMarginHelper.validadeMarginCategory(this.newRecords);
        PriceMarginHelper.calcScore(this.newRecords);
    }

}
