package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeterySectionModel extends CrudFormModel {
    @Caller
    def caller;
    
    @Service('ComisCemeteryService')
    def svc;
    
    boolean isShowConfirm() {
        return false;
    }
    
    void beforeSave(mode){
        entity.parentid = caller.entity.objid;
    }
    
    void approve() {
        if (MsgBox.confirm('Approve section?')) {
            entity.putAll(svc.approveSection(entity));
            caller.refresh();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate section?')) {
            entity.putAll(svc.deactivateSection(entity));
            caller.refresh();
        }
    }
}