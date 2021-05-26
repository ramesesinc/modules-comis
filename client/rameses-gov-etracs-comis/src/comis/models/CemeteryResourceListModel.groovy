package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeteryResourceListModel extends CrudListModel {
    
    def parent;
    boolean showClose = false;
    
    def getCustomFilter() {
        return ["parentid = :objid", parent ? parent : [:]];
    }    
    
}