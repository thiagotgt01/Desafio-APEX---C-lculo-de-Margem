/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-07-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PriceMarginHelper {
    public PriceMarginHelper() {}

    public static void validadeMarginCategory(List<PriceMargin__c> priceMarginList){
        
        for(PriceMargin__c margin : priceMarginList){
            if(!validateCategories(margin)){
                margin.addError(Label.MarginParametersError);
            }
        }
    }

    public static Boolean validateCategories(PriceMargin__c margin){
        if((String.isBlank(margin.Product__c) && String.isBlank(margin.ProductHierarchy__c)) ||
           (String.isBlank(margin.Account__c) && String.isBlank(margin.AccountGroup__c))     ||
           (String.isBlank(margin.State__c) && String.isBlank(margin.DistributionCenter__c))){
                return false;
            }
        return true;
    }

    public static void calcScore (List<PriceMargin__c> priceMarginList){
        for(PriceMargin__c margin : priceMarginList){
            // calc score
            Integer score = 0;

            if(String.isNotEmpty(margin.State__c)){
                score += 10;
            }
            else if (String.isNotEmpty(margin.DistributionCenter__c)) {
                score += 20;
            }
            if(String.isNotEmpty(margin.Account__c)){
                score += 200;
            }
            else if (String.isNotEmpty(margin.AccountGroup__c)) {
                score += 100;
            }
            if(String.isNotEmpty(margin.Product__c)){
                score += 2000;
            }
            else if (String.isNotEmpty(margin.ProductHierarchy__c)) {
                score += 1000;
            }

            margin.Score__c = score;
        }
    }

}
