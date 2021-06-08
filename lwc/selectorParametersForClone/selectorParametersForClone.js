import { LightningElement, api, wire, track } from 'lwc';
import getSettingsForClone from '@salesforce/apex/AnimalController.getSettingsForClone';
import { getRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FILED from '@salesforce/schema/Animal__c.Name';

export default class SelectorParametersForClone extends LightningElement {

    @api recordId;
    settingsForClone;
    selectingParameters = true;
    queryFields = [];
    arrayFields = [];
    @wire(getRecord, { recordId: '$recordId', fields: '$queryFields' })
    animalParent;

    async connectedCallback() {
        this.settingsForClone = await getSettingsForClone();
        for (let i of this.settingsForClone) {
            this.arrayFields.push(i.API_Name__c);
        }
    }

    async handleConfirm(event) {
        let temp = this.template.querySelectorAll(".for-query");
        let idList = [];
        for (let i of temp) {
            if (i.checked) {
                let id = i.id;
                id = id.slice(0, id.indexOf('-'));

                idList.push(id);
            }
        }


        this.queryFields = []; //without this not working

        for (let i of this.settingsForClone) {
            if (idList.includes(i.Id)) {
                this.queryFields.push(`Animal__c.${i.API_Name__c}`);
            }
        }

        

        await refreshApex(this.animalParent)
        console.log(this.animalParent.data.fields);
        this.selectingParameters = false;
    }

    closeQuickAction() {
        this.dispatchEvent(new CustomEvent('close'));
        this.dispatchEvent(new ShowToastEvent({
            "variant": "success",
            "title": "Success!",
            "message": "Clone created successfully!",
        }))
    }

    get name(){
        if("Name" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Name.value;
        } else {
            return "";
        }
    }

    get type(){
        if("Type__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Type__c.value;
        } else {
            return "";
        }
    }

    get breed(){
        if("Breed__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Breed__c.value;
        } else {
            return "";
        }
    }

    get rating(){
        if("Rating__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Rating__c.value;
        } else {
            return "";
        }
    }

    get image_url(){
        if("Image_URL__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Image_URL__c.value;
        } else {
            return "";
        }
    }

    get weight(){
        if("Weight__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Weight__c.value;
        } else {
            return "";
        }
    }

    get age(){
        if("Age__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Age__c.value;
        } else {
            return "";
        }
    }

    get animal_owner(){
        if("Animal_Owner__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Animal_Owner__c.value;
        } else {
            return "";
        }
    }

    get health_indicator(){
        if("Health_Indicator__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Health_Indicator__c.value;
        } else {
            return "";
        }
    }

    get pregnant(){
        if("Pregnant__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Pregnant__c.value;
        } else {
            return false;
        }
    }

    get vitamins(){
        if("Vitamins__c" in this.animalParent.data.fields){
            return this.animalParent.data.fields.Vitamins__c.value;
        } else {
            return "";
        }
    }
}