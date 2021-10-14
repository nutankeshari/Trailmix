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
public with sharing class HierarchyComponentExample implements HierarchyComponentInterface {

    public HierarchyComponentController.hierarchyData getFullHierarchyData(String inData){
        HierarchyComponentController.hierarchyData hdAll = new HierarchyComponentController.hierarchyData();
        List<HierarchyComponentController.node> nodes = new List<HierarchyComponentController.node>();
        
        for(Integer i=0;i<110;i=i+10){
            HierarchyComponentController.node node = new HierarchyComponentController.node();
            node.id = String.valueOf(i);
            if(i>0){
                node.parentid = String.valueOf(i-10);
            }
            node.text = 'Node: ' + String.valueOf(i) ;
            node.description = 'Node Number: ' + String.valueOf(i); 
            node.type = 'text';
            node.imageURL = 'http://i.kinja-img.com/gawker-media/image/upload/s--RWUij5kb--/c_fit,fl_progressive,q_80,w_636/766401252534717839.png';
            HierarchyComponentController.evt evt = new HierarchyComponentController.evt();
            evt.name = 'e.force:navigateToObjectHome';
            evt.params = '{"scope":"Account"}';
            //evt.name = 'e.force:navigateToComponent';
            //evt.params = '{"componentDef":"kkltng:ContactsNearby","componentAttributes":{"maxDistance":"1000"}}';

            node.rootNodeClick = evt;
            node.leftIconClick = null;
            node.rightIconClick = null;
            node.data = null;
            nodes.add(node);

            for(Integer j=1;j<10;j++){
                HierarchyComponentController.node cnode = new HierarchyComponentController.node();
                cnode.id = String.valueOf(j+i);
                cnode.parentid = String.valueOf(i);
                cnode.text = 'Node: ' + String.valueOf(j+i);
                cnode.description = 'Node Number: ' + String.valueOf(j+i);
                cnode.type = 'text';
                cnode.rootNodeClick = null;
                cnode.leftIconClick = null;
                cnode.rightIconClick = null;
                cnode.data = null;

                nodes.add(cnode);
            }
        }
        hdAll.nodes = nodes;
        return hdAll;
    }

    public HierarchyComponentController.hierarchyData getHierarchyDataOnDemand(String inData,HierarchyComponentController.node rootNode){
        HierarchyComponentController.hierarchyData hdAll = new HierarchyComponentController.hierarchyData();
        //HierarchyComponentController.node rn = rootNode;
        List<HierarchyComponentController.node> nodes = new List<HierarchyComponentController.node>();
        

        for(Integer i=0;i<110;i=i+10){
            HierarchyComponentController.node node = new HierarchyComponentController.node();
            node.id = String.valueOf(i);
            if(i>0){
                node.parentid = String.valueOf(i-10);
            }
            node.text = 'Node: ' + String.valueOf(i) ;
            node.description = 'Node Number: ' + String.valueOf(i); 
            node.type = 'text';
            node.imageURL = 'http://i.kinja-img.com/gawker-media/image/upload/s--RWUij5kb--/c_fit,fl_progressive,q_80,w_636/766401252534717839.png';
            HierarchyComponentController.evt evt = new HierarchyComponentController.evt();
            evt.name = 'e.force:navigateToObjectHome';
            evt.params = '{"scope":"Account"}';

            node.rootNodeClick = evt;
            node.leftIconClick = null;
            node.rightIconClick = null;
            node.data = null;
            nodes.add(node);

            for(Integer j=1;j<10;j++){
                HierarchyComponentController.node cnode = new HierarchyComponentController.node();
                cnode.id = String.valueOf(j+i);
                cnode.parentid = String.valueOf(i);
                cnode.text = 'Node: ' + String.valueOf(j+i);
                cnode.description = 'Node Number: ' + String.valueOf(j+i);
                cnode.type = 'text';
                cnode.rootNodeClick = null;
                cnode.leftIconClick = null;
                cnode.rightIconClick = null;
                cnode.data = null;

                nodes.add(cnode);
            }
        }
        hdAll.rootNode = rootNode;
        hdAll.nodes = nodes;
        return hdAll;

    }

}