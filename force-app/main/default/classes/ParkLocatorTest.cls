@isTest
Private Class ParkLocatorTest{

Static testMethod void method1(){
Test.setMock(WebServiceMock.class,new ParkServiceMock());
Test.startTest();
ParkLocator.country('India');
Test.stopTest();
}

}