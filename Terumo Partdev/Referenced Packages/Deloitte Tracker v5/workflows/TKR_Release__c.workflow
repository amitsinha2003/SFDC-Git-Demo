<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>TKR_Release_Approved</fullName>
        <description>Tracker - Release Approved</description>
        <protected>true</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_Release_Approved_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Release_rejected</fullName>
        <description>Tracker - Release rejected</description>
        <protected>true</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_Release_Rejected_Mobile_Friendly</template>
    </alerts>
    <fieldUpdates>
        <fullName>TKR_Set_Release_Status_Approved</fullName>
        <description>Set Release Status - Approved</description>
        <field>Approval__c</field>
        <literalValue>Approved</literalValue>
        <name>TKR Set Release Status - Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TKR_Set_Release_Status_Not_Submitted</fullName>
        <description>Set Release Status - Not Submitted</description>
        <field>Approval__c</field>
        <literalValue>Not Submitted</literalValue>
        <name>TKR Set Release Status - Not Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TKR_Set_Release_Status_Rejected</fullName>
        <description>Set Release Status - Rejected</description>
        <field>Approval__c</field>
        <literalValue>Rejected</literalValue>
        <name>TKR Set Release Status - Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TKR_Set_Release_Status_Submitted</fullName>
        <description>Set Release Status - Submitted</description>
        <field>Approval__c</field>
        <literalValue>Submitted</literalValue>
        <name>TKR Set Release Status - Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
