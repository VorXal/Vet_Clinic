trigger ProductTrigger on Product2 (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        ProductTriggerHandler.onBeforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
}