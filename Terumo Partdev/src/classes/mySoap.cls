global with sharing class mySoap{

 webservice  static id insertAccount(){
 
   Account acc = new Account();
   acc.Name = 'test';
   acc.Active__c = 'True';
   acc.AccountNumber = '11111';
   acc.Phone = '(800) 555-8888';
   insert acc;
   return acc.id;
 
 }


}