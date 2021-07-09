package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeteryResourceListModel extends CrudListModel {
    
    def parent;
    boolean showClose = false;

    String getTitle() {
        return 'Blocks (Section ' + parent.code + ')';
    }
    
    def getCustomFilter() {
        return ["blockid = :objid", parent ? parent : [:]];
    }    
    
}