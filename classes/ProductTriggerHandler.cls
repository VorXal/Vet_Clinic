public with sharing class ProductTriggerHandler {

    public static void onBeforeUpdate(Map<Id,Product2> newProducts, Map<Id,Product2> oldProducts){
        ProductTriggerHandlerHelper.checkProteins(newProducts, oldProducts);
    }
    
}