<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_LastNameEmailHiddenField</fullName>
        <description>nsebastian 11/4/2015: This updates the HIDDEN field which checks for duplicates in Salesforce.</description>
        <field>HIDDEN_LastName_Email__c</field>
        <formula>LastName + &apos;__&apos;+Email</formula>
        <name>Update_LastNameEmailHiddenField</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Rule_Update_LastName_and_Email</fullName>
        <actions>
            <name>Update_LastNameEmailHiddenField</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>nsebastian 11/4/2015: This rule triggered when lastname or email is updated to check for uniqueness.</description>
        <formula>ISNEW() || (ISCHANGED(LastName) || ISCHANGED(Email))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
