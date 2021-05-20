<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email</fullName>
        <description>Send email</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_animal_was_created</template>
    </alerts>
    <fieldUpdates>
        <fullName>Test</fullName>
        <field>Name</field>
        <formula>Name + &apos;_wf&apos;</formula>
        <name>Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Send email when new animal is created</fullName>
        <actions>
            <name>Send_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>This rule sending email when new animal is created</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
