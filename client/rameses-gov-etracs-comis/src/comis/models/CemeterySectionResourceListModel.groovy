package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeterySectionResourceListModel extends CrudListModel {
    
    def section;
    
    boolean showClose = false;
    
    def getCustomFilter() {
        return ["parentid = :objid", section ? section : [:]];
    }    
    
}