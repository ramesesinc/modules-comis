package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeterySectionListModel extends CrudListModel {
    
    def cemetery;
    def refreshSections;
    
    boolean showClose = false;
    
    def getCustomFilter() {
        return ["parentid = :objid", cemetery];
    }    
    
    void removeEntity() {
        super.removeEntity();
        refreshSections();
    }
    
    
}