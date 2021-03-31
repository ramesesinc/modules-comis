package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeterySectionListModel extends CrudListModel {
    
    def cemetery;
    
    boolean showClose = false;
    
    def getCustomFilter() {
        return ["parentid = :objid", cemetery];
    }    
    
}