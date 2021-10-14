@isTest(SeeAllData=False)
Private Class AnimalLocatorTest{
static testmethod void method1(){
Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
Test.startTest();
AnimalLocator.getAnimalNameById(1);
Test.stopTest();
}

}