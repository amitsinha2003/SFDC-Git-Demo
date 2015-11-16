<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>MICO_Update_Parent_Approval_Date</fullName>
        <description>This will blank out the approval date</description>
        <field>Approval_Date__c</field>
        <name>Update Parent Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <targetObject>Test_Script__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_Update_Parent_Approval_Status</fullName>
        <description>This will set the Approval status to Open</description>
        <field>Approval_Status__c</field>
        <literalValue>Open</literalValue>
        <name>Update Parent Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Test_Script__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Test_Script_Step_Set_Sequence_if_Null</fullName>
        <description>Tracker: Set the value of the Sequence field if null</description>
        <field>Ranked_Sequence__c</field>
        <formula>VALUE(RIGHT(Name, 6))</formula>
        <name>Test Script Step Set Sequence if Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>TKR Test Script Step Sequencer</fullName>
        <actions>
            <name>Test_Script_Step_Set_Sequence_if_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>TKR_Test_Template_Steps__c.Ranked_Sequence__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Tracker: Pre populate the Test Script Step &gt; Sequence field with the numerical value of the Ref/Name field</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR_Re-open Test Script</fullName>
        <actions>
            <name>MICO_Update_Parent_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICO_Update_Parent_Approval_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>TKR_Test_Templates__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_Test_Templates__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>This rule will reopen the test script and blank out the Approval date if any test steps are changed for an approved/rejected test script</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
