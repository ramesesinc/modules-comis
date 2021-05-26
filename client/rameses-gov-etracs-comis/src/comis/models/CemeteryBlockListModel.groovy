package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;

class CemeteryBlockListModel extends CrudListModel {
    @Caller 
    def caller;

    def parent;
    boolean showClose = false;

    def getCustomFilter() {
        return ["parentid = :objid", parent ? parent : [:]];
    }    

    public void setSelectedItem(item) {
        super.setSelectedItem(item);
        caller.setBlock(item);
    }

    public def fetchList(o) {
        def list = super.fetchList(o);
        if (!list) {
            caller.setBlock(null);
        }
        return list;
    }

}