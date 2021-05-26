package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeteryBlockModel extends CrudFormModel {
    @Caller
    def caller;
    
    @Service('ComisCemeteryService')
    def svc;
    
    public void afterOpen(){
        updateAllowCreate();
    }
    
    public void afterCreate(){
        updateAllowCreate();
    }
    
    public void afterSave(){
        if (mode == 'create') {
            caller.reload();
        }
        updateAllowCreate();
    }
    
    void updateAllowCreate() {
        entity.allowcreate = false;
        if (caller.entityContext) {
            entity.allowcreate = caller.entityContext.state != 'INACTIVE';
        }
    }
    
    boolean isShowConfirm() {
        return false;
    }
    
    void beforeSave(mode){
        entity.parentid = caller.parent.objid;
    }
    
    void approve() {
        if (MsgBox.confirm('Approve section?')) {
            entity.putAll(svc.approveBlock(entity));
            caller.reload();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate section?')) {
            entity.putAll(svc.deactivateBlock(entity));
            caller.reload();
        }
    }
}