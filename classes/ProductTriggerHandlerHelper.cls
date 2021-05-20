public with sharing class ProductTriggerHandlerHelper {

    public static void checkProteins(Map<Id,Product2> newProducts, Map<Id,Product2> oldProducts){
        List<Id> newProductIds = new List<Id>(newProducts.keySet());
        List<Food__c> foodList = [SELECT Id, Product__r.Proteins__c, Animal__r.Age__c 
                                  FROM Food__c WHERE Product__r.Id in: newProductIds];
        
        for(Food__c food: foodList){
            if(newProducts.get(food.Product__c).Proteins__c < 20){
                if(food.Animal__r.Age__c > 9){
                    newProducts.get(food.Product__c).addError('Proteins < 20');
                }
            }
        }
    }
    
}