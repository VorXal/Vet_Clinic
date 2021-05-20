trigger AnimalTrigger on Animal__c (before update) {
    if(Trigger.isUpdate && Trigger.isBefore){
        AnimalTriggerHandler.onBeforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
}