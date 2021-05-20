public with sharing class AnimalTriggerHandlerHelper {
	
    public static void checkProteins(Map<Id,Animal__C> newAnimals, Map<Id,Animal__C> oldAnimals){
        List<Id> newAnimalIds = new List<Id>(newAnimals.keySet());
        List<Food__c> foodList = [SELECT Id, Product__r.Proteins__c, Animal__r.Age__c 
                                  FROM Food__c WHERE Animal__r.Id in: newAnimalIds];
        
        for(Food__c food: foodList){
            System.debug(newAnimals.get(food.Animal__c).Age__c);
            if(newAnimals.get(food.Animal__c).Age__c > 9){
                if(food.Product__r.Proteins__c < 20){
                    newAnimals.get(food.Animal__c).addError('Proteins < 20');
                }
            }
        }
    }
    
}