public with sharing class AnimalTriggerHandler {
    public static void onBeforeUpdate(Map<Id,Animal__C> newAnimals, Map<Id,Animal__C> oldAnimals){
        AnimalTriggerHandlerHelper.checkProteins(newAnimals, oldAnimals);
    }
}