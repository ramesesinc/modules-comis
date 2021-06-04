package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeterySectionModel extends CrudFormModel {
    @Caller
    def caller;
    
    @Service('ComisCemeteryService')
    def svc;
    
    public void afterSave(){
        caller.reload();
    }
    
    boolean isShowConfirm() {
        return false;
    }
    
    void beforeSave(mode){
        entity.parentid = caller.parent.objid;
    }
    
}