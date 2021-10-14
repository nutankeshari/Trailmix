/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-26-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   01-26-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
global interface HierarchyComponentInterface {
    HierarchyComponentController.hierarchyData getFullHierarchyData(String inData);
    HierarchyComponentController.hierarchyData getHierarchyDataOnDemand(String inData,HierarchyComponentController.node rootNode);
}