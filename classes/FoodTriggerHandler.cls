public with sharing class FoodTriggerHandler {

    public static void onBeforeInsert(List<Food__c> foodList){
        FoodTriggerHandlerHelper.checkProteins(foodList);
    }
    
    public static void onBeforeUpdate(List<Food__C> foodList){
        FoodTriggerHandlerHelper.checkProteins(foodList);
    }
    
}