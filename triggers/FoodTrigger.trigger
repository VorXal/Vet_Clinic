trigger FoodTrigger on Food__c (before insert, before update) {
	
    if(Trigger.isInsert && Trigger.isBefore){
        FoodTriggerHandler.onBeforeInsert(Trigger.New);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore){
        FoodTriggerHandler.onBeforeUpdate(Trigger.New);
    }
    
}