package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeterySectionModel extends CrudFormModel {
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
            caller.refreshSections();
            caller.reload();
        }
        updateAllowCreate();
    }
    
    void updateAllowCreate() {
        entity.allowcreate = false;
        if (caller.cemetery) {
            entity.allowcreate = caller.cemetery.state != 'INACTIVE';
        }
    }
    
    boolean isShowConfirm() {
        return false;
    }
    
    void beforeSave(mode){
        entity.parentid = caller.cemetery.objid;
    }
    
    void approve() {
        if (MsgBox.confirm('Approve section?')) {
            entity.putAll(svc.approveSection(entity));
            caller.reload();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate section?')) {
            entity.putAll(svc.deactivateSection(entity));
            caller.reload();
        }
    }
}