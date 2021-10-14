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
@isTest
private class HierarchyComponentTest {
    

    @isTest static void test_method_one() {
        // Test the Controller first
        String implClsName = 'HierarchyComponentExample';
        Boolean fullData = true;
        String rootNode = null;
        String inData = null;

        HierarchyComponentController.hierarchyData hd;

        // Positive Test
        //HierarchyComponentController hc = new HierarchyComponentController();
        String ret = HierarchyComponentController.getData(inData,implClsName,fullData,rootNode);
        hd = (HierarchyComponentController.hierarchyData) JSON.deserialize(ret, HierarchyComponentController.hierarchyData.class);
        
        //System.assert(ret.length()>0); // all good here
        System.assert(hd.nodes.size()>0);
        System.Debug('First Test done');
    
       //Negative test; class not available
       implClsName = 'Thisisabadclass';
       try{
            ret = HierarchyComponentController.getData(inData,implClsName,fullData,rootNode);
        }catch(Exception e){
            System.assert(e.getMessage().contains('Attempt to de-reference a null object'));
            System.Debug('Second Test done');
        }


        //Check if the rootnode sent in the same as the one coming back
        implClsName = 'HierarchyComponentExample';
        fullData = false;
        rootNode = '{"id":"0"}';
        inData = null;
        ret = HierarchyComponentController.getData(inData,implClsName,fullData,rootNode);
        hd = (HierarchyComponentController.hierarchyData) JSON.deserialize(ret, HierarchyComponentController.hierarchyData.class);
        HierarchyComponentController.node sNodeData = new HierarchyComponentController.node();
        sNodeData = (HierarchyComponentController.node) JSON.deserialize(rootNode, HierarchyComponentController.node.class);
        System.assertEquals(hd.rootNode.id,sNodeData.id);
        System.Debug('Third Test done');
    }
    
    
}