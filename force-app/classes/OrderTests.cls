@isTest
public with sharing class OrderTests {
    
    @testSetup static void SetupTestData (){
        
        TestDataFactory.InsertTestData(7);   
    } 
    
    
    @isTest static void OrderUpdate_UnitTest(){
        
        Test.startTest();
        Order rec = [select id, Status from Order limit 1];
        Product2 prod = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];
        
        rec.status = constants.ACTIVATED_ORDER_STATUS;
        Update rec;
        Product2 updatedprod = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];
        
        
        TestDataFactory.VerifyQuantityOrdered(prod,updatedprod,constants.DEFAULT_ROWS);
        Test.stopTest();    
        
    }
    @isTest static void OrderExtension_UnitTest(){
        
        Order rec = [select id, Status from Order limit 1];
        PageReference pageRef = Page.OrderEdit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',rec.id);
        ApexPages.StandardController sc = new ApexPages.standardController(rec);
        
        OrderExtension cc = new OrderExtension(sc);
        cc.SelectFamily();
        cc.OnFieldChange();
        cc.Save();
        cc.First();
        cc.Next();
        cc.Previous();
        cc.Last();
        cc.GetHasPrevious();
        cc.GetHasNext();
        cc.GetTotalPages();
        cc.GetFamilyOptions();
        
        ChartHelper.GetInventory();
        
        
    }
    
    
}