<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>TKR_Email_Alert_sent_to_Business_quality_for_UserStory_Approval_if_Criticality_h</fullName>
        <description>Email Alert sent to Business quality for User Story Approval if Criticality is high</description>
        <protected>false</protected>
        <recipients>
            <field>Compliance_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_Business_Quality_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Alert_sent_to_Computer_Systems_Quality_for_User_Story_Approval_if_Crit</fullName>
        <description>Email Alert sent to Computer Systems Quality for User Story Approval if Criticality is high</description>
        <protected>false</protected>
        <recipients>
            <field>Computer_Systems_Quality__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_Computer_Systems_Quality_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Alert_sent_to_System</fullName>
        <description>Email Alert sent to System Owner for User Story Approval</description>
        <protected>false</protected>
        <recipients>
            <field>System_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_System_Owner_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Alert_sent_to_System_Custodian_for_User_Story_Approval</fullName>
        <description>Email Alert sent to System Custodian for User Story Approval if Criticality is high</description>
        <protected>false</protected>
        <recipients>
            <field>System_Custodian__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_System_Custodian_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Alert_sent_to_System_Owner_for_User_Story_Approval</fullName>
        <description>Email Alert sent to System Owner for User Story Approval if Criticality is high</description>
        <protected>false</protected>
        <recipients>
            <field>System_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_System_Owner_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Notification_to_the_Submitter_and_BA_when_the_User_Story_has_been_Reje</fullName>
        <description>Email Notification to the Submitter and BA when the User Story has been Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Supporting_BA__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Rejection_Template_to_BA_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Notification_to_the_Submitter_when_the_User_Story_has_been_Rejected</fullName>
        <description>Email Notification to the Submitter when the User Story has been Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Submitter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Rejection_Template_to_Submitter_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_Email_Tester</fullName>
        <description>Email Tester</description>
        <protected>false</protected>
        <recipients>
            <field>Sprint_Tester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Ready_for_Test_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_System_Custodian_Email_Alert_for_Approval_of_User_Story</fullName>
        <description>Email Alert sent to System Custodian for User Story Approval</description>
        <protected>false</protected>
        <recipients>
            <field>System_Custodian__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Template_System_Custodian_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_USERSTORY_Send_Congratulations</fullName>
        <description>USER STORY Send Congratulations</description>
        <protected>false</protected>
        <recipients>
            <field>Compliance_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Computer_Systems_Quality__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Developer__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sprint_Tester__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Supporting_BA__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Passed_Mobile_Friendly</template>
    </alerts>
    <alerts>
        <fullName>TKR_User_Story_Passed_Send_Email</fullName>
        <description>User Story Passed - Send Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>bclemence@terumo.partdev</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>TKR_Tracker_Templates/TKR_User_Story_Passed_Mobile_Friendly</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Status_Field_Update</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Approval Status Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Status_Rejected_Field_Update</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Approval Status Rejected Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Business_Quality_Approval_Date</fullName>
        <field>TKR_Business_Quality_Approval_Date__c</field>
        <name>Business Quality Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Business_Quality_Approved_to_False</fullName>
        <field>TKR_Business_Quality_Approved__c</field>
        <literalValue>0</literalValue>
        <name>Business Quality Approved to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_the_Approval_Status</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Open</literalValue>
        <name>Change the Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Computer_Systems_Quality_Approval_Date</fullName>
        <field>TKR_Computer_System_Qty_Approval_Date__c</field>
        <name>Computer Systems Quality Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Computer_Systems_Quality_Approved</fullName>
        <field>TKR_Computer_Systems_Quality_Approved__c</field>
        <literalValue>0</literalValue>
        <name>Computer Systems Quality Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_User_Story_Passed_Set_Close_Date</fullName>
        <description>Close Date = Today</description>
        <field>Close_Date__c</field>
        <formula>today()</formula>
        <name>User Story Passed - Set Close Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_User_Story_Release_Comp_Unchec</fullName>
        <field>Release_Completeness__c</field>
        <literalValue>0</literalValue>
        <name>User Story Release Completeness - Unchec</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MICO_User_Story_Release_Completeness</fullName>
        <field>Release_Completeness__c</field>
        <literalValue>1</literalValue>
        <name>User Story Release Completeness</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>System_Custodian_Approved_Date</fullName>
        <field>TKR_System_Custodian_Approval_Date__c</field>
        <name>System Custodian Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>System_Custodian_Approved_To_False</fullName>
        <description>Set System Custodian Approved to False</description>
        <field>TKR_System_Custodian_Approved__c</field>
        <literalValue>0</literalValue>
        <name>System Custodian Approved To False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>System_Owner_Approved_Date</fullName>
        <field>TKR_System_Owner_Approval_Date__c</field>
        <name>System Owner Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>System_Owner_Approved_To_False</fullName>
        <field>TKR_System_Owner_Approved__c</field>
        <literalValue>0</literalValue>
        <name>System Owner Approved To False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>TKR Change the Approval Status to Open</fullName>
        <actions>
            <name>Business_Quality_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Business_Quality_Approved_to_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_the_Approval_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Computer_Systems_Quality_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Computer_Systems_Quality_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>System_Custodian_Approved_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>System_Custodian_Approved_To_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>System_Owner_Approved_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>System_Owner_Approved_To_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Change the Approval Status to Open when user tries to edit the I Want to</description>
        <formula>ISCHANGED( I_Want_To__c ) || ISCHANGED( As_A_text__c )  || ISCHANGED( So_that__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TKR User Story Send Approval Notification</fullName>
        <actions>
            <name>TKR_Email_Alert_sent_to_System</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_System_Custodian_Email_Alert_for_Approval_of_User_Story</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>TKR_User_Story__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.GXP__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.Critical__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>IF GxP = No AND Critical = No, then approval request email notification to be sent to System Owner and System Custodian.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR User Story Send Approval Notification to All</fullName>
        <actions>
            <name>TKR_Email_Alert_sent_to_Business_quality_for_UserStory_Approval_if_Criticality_h</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_Email_Alert_sent_to_Computer_Systems_Quality_for_User_Story_Approval_if_Crit</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_Email_Alert_sent_to_System_Custodian_for_User_Story_Approval</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_Email_Alert_sent_to_System_Owner_for_User_Story_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>TKR_User_Story__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.GXP__c</field>
            <operation>notEqual</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.Critical__c</field>
            <operation>notEqual</operation>
            <value>No</value>
        </criteriaItems>
        <description>The approval request to be sent to System Owner, System Custodian, Business Quality and Computer Systems Quality.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR User Story Send Rejection Notification</fullName>
        <actions>
            <name>TKR_Email_Notification_to_the_Submitter_and_BA_when_the_User_Story_has_been_Reje</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_Email_Notification_to_the_Submitter_when_the_User_Story_has_been_Rejected</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>TKR_User_Story__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>Rule to send the rejection notification to BA and Submitter when the User Story has been rejected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR_User Story Passed</fullName>
        <actions>
            <name>TKR_USERSTORY_Send_Congratulations</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TKR_User_Story_Passed_Send_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>MICO_User_Story_Passed_Set_Close_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When a User Story is set to status &apos;Done&apos;, send an email and update the close date field</description>
        <formula>ISCHANGED( Development_Stage__c ) &amp;&amp; text(Development_Stage__c)= $Setup.TKR_Burn_Status__c.Burn_Status_Value__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TKR_User Story Release Completeness</fullName>
        <actions>
            <name>MICO_User_Story_Release_Completeness</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>TKR_User_Story__c.Validation_steps__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.Release_Steps_Manual__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Verify the release completeness</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR_User Story Release Completeness - Uncheck</fullName>
        <actions>
            <name>MICO_User_Story_Release_Comp_Unchec</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>TKR_User_Story__c.Validation_steps__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>TKR_User_Story__c.Release_Steps_Manual__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Verify the release completeness</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TKR_User_Story_Ready_For_Testing</fullName>
        <actions>
            <name>TKR_Email_Tester</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When a User Story is set to status &apos;Ready for Test&apos; send an email to the assigned tester</description>
        <formula>ISCHANGED( Development_Stage__c ) &amp;&amp; text(Development_Stage__c)= &quot;Ready For Test&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
