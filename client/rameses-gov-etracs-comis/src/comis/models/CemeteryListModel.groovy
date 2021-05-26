package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.CrudFormModel;
import system.explorer.*;

class CemeteryListModel {
    @Binding
    def binding;
    
    @Service('ComisCemeteryService')
    def svc;

    def rootNode = new Node([id: 'cemetery:list', caption: 'Cemeteries']); 
    def selectedNode;
    String title = "Cemeteries"

    def tree = [
        isAllowOpenOnSingleClick: { return true; },  
        isRootVisible: { return true; },
        getRootNode : { return rootNode; },

        getNodeList: {node-> 
            println 'getNodeList => ' + node;
            if (node.item == null) return null; 
        
            loadChildren(node.item); 
            return node.item.children; 
        }, 
        
        initChildNode: {cnode, pnode-> 
            if (pnode?.parent == null && cnode.icon == null) {
                cnode.icon = 'images/pyramid.png';
            } 
        }, 
                
        openLeaf: {node->
            println "NODE ================== "
            node.each{k,v -> println k + ": " + v}

            def invoker = Inv.lookupOpener("cemetery:list", [:]);
            InvokerUtil.invoke(invoker);
            // def invoker = node?.item?.invoker;
            // if (invoker != null) InvokerUtil.invoke(invoker);
            
            return null; 
        }, 
                
        openFolder: {node->
            println ' openFolder => ' + node;
            selectedNode = node;
            binding.refresh("opener");

            // def item = [id:'new', caption:'New Cemetery', folder: node];
            // node.children.add(item)
            // item = [id:'old', caption:'Old Cemetery', folder: node];
            // node.children.add(item)
            return null;
        }                
    ] as ExplorerTreeNodeModel;


    boolean loadChildren( root ) {
        printnl 'loadChildren => ' + root.id
        // def folders = OsirisContext.session.getFolders( root.folder ? root.folder : root.id );
        // if (!folders) return false;

        root.children = [];
        // folders.each { 
        //     def item = [id:it.id, caption:it.caption, folder:it];
        //     if (it.invoker != null) { 
        //         item.invoker = it.invoker;                
        //         item.id = it.invoker.workunitid;
        //         item.caption = it.invoker.caption; 
        //         item.icon = it.invoker.properties?.icon? it.invoker.properties.icon: defaultIcon;                
        //         item.leaf = true;
        //         root.children.add(item);
        //     } 
        //     else if (loadChildren(item)) {
        //         root.children.add(item);
        //     }
        // }
        return root.children.size() > 0
    } 


    /*===============================================
    * OPENER SUPPORT
    ===============================================*/
    def opener;

    def getOpener() {
        return Inv.lookupOpener('cemetery:list', [:])
    }
    
}