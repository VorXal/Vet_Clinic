public with sharing class FoodTriggerHandlerHelper {

    public static void checkProteins(List<Food__c> foodList){
        List<Id> animalIdList = new List<Id>();
        List<Id> productIdList = new List<Id>();
        
        for(Food__c food: foodList){
            animalIdList.add(food.Animal__c);
            productIdList.add(food.Product__c);
        }
        
        List<Animal__c> animals = [SELECT Age__c FROM Animal__c WHERE Id in: animalIdList];
        List<Product2> products = [SELECT Proteins__c FROM Product2 WHERE Id in: productIdList];
        
        for(Food__c food: foodList){
            for(Animal__c animal: animals){
                for(Product2 product: products){
                    if(food.Animal__c == animal.Id && food.Product__c == product.Id){
                        if(animal.Age__c > 9 && product.Proteins__c < 20){
                        	food.addError('Proteins in food less than 20, when age of animal is more than 9');   
                        }
                    }
                }
            }
        }
    }
}