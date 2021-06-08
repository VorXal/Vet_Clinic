import { LightningElement, api, wire, track } from 'lwc';
import getSettingsForClone from '@salesforce/apex/AnimalController.getSettingsForClone';
import { getRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
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

        console.log(this.queryFields);

        // this.queryFields = []; //without this not working

        for (let i of this.settingsForClone) {
            if (idList.includes(i.Id)) {
                this.queryFields.push(`Animal__c.${i.API_Name__c}`);
            }
        }

        

        await refreshApex(this.animalParent)
        console.log(this.animalParent);
        this.selectingParameters = false;
    }
}