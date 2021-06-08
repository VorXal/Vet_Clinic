public class AnimalController {
	private Animal__c animal;
    public boolean displayPopup {get; private set;}  
    public List<Vitamin__mdt> vitamins {
        get{
            if(animal.Pregnant__c){
                List<Vitamin__mdt> filtered = new List<Vitamin__mdt>();
                
                for(Vitamin__mdt vt: vitamins){
                    if(vt.isPregnant__c){
                        filtered.add(vt);
                    }
                }
                
                return filtered;
            } else {
            	return vitamins;            
            }    
        }
        private set {
            vitamins = value;
        }}
    
    public boolean PregnantStatus{
        get{
        	return this.animal.Pregnant__c;    
        }
        set{
            this.animal.Pregnant__c = value;
        }
    }
    
        
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
    
    public void changeStatus(){
        animal.Vitamins__c = '';
        update animal;
    }
    
    public PageReference getDataFromJS(){
     	String vitaminName = Apexpages.currentPage().getParameters().get('vitamin');
        
        animal.Vitamins__c = vitaminName;
        update animal;
        
        return null;
    }
    
    @AuraEnabled
    public static List<Animal_Settings__c> getSettingsForClone(){
        return [SELECT Name, API_Name__c FROM Animal_Settings__c];
    }
    
    public AnimalController(){
        animal = [SELECT Pregnant__c, Vitamins__c FROM Animal__c WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    	vitamins = [SELECT MasterLabel, isPregnant__c FROM Vitamin__mdt];
    }
}