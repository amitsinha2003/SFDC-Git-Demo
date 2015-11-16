<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>TKR_Send_rejection_notification_to_last_modifier_of_test_script</fullName>
        <description>Send rejection notification to last modifier of test script</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_Test_Script_Rejection_Message_Mobile_Friendly</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Rejection_Update</fullName>
        <description>Update Approval status to Rejected</description>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Approval Rejection Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_Update_Approval_Date</fullName>
        <description>This will blank out the Approval date if the approved test script is edited</description>
        <field>Approval_Date__c</field>
        <name>Update Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_Update_Approval_Status</fullName>
        <description>Update approval status to Open</description>
        <field>Approval_Status__c</field>
        <literalValue>Open</literalValue>
        <name>Update Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_Approval</fullName>
        <description>Update status to &quot;Pending Approval&quot; on initial submission</description>
        <field>Approval_Status__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateApproval_StatusToOpen_TestScript</fullName>
        <description>MICO: Update the Approval Status to Open when the approval request is recalled / rejected.</description>
        <field>Approval_Status__c</field>
        <literalValue>Open</literalValue>
        <name>UpdateApproval StatusToOpen-TestScript</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Date</fullName>
        <description>Update Approval date to current time</description>
        <field>Approval_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Status</fullName>
        <description>Change status to &quot;Approved&quot;</description>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>TKR_Update Approved_Test_Script</fullName>
        <actions>
            <name>MICO_Update_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICO_Update_Approval_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule will change the status of an approved Test Script to Open when it is updated</description>
        <formula>AND(    OR(       ISPICKVAL(Approval_Status__c, &apos;Approved&apos;),        ISPICKVAL(Approval_Status__c, &apos;Rejected&apos;)    ),    NOT(ISCHANGED(Approval_Status__c)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
