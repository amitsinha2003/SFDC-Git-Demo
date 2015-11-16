<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>TKR_Set_Actual_Completion_Date</fullName>
        <description>Tracker: Set Milestone Actual Completion Date</description>
        <field>Actual_Completion_Date__c</field>
        <formula>Today()</formula>
        <name>TKR Set Actual Completion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>TKR Milestone Complete - Set Actual Date</fullName>
        <actions>
            <name>TKR_Set_Actual_Completion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>TKR_Milestone__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_Milestone__c.Actual_Completion_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Tracker: Set Actual Completion Date on Milestone</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
