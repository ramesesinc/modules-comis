package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeterySectionResourceModel extends CrudFormModel {
    @Caller
    def caller;
    
    @Service('ComisCemeteryService')
    def svc;
    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterCreate(){
        entity.state = 'DRAFT';
    }
    
    void beforeSave(mode){
        entity.parentid = caller.section.objid;
    }
    
    void afterSave(){
        caller.reload();
    }
    
    void approve() {
        if (MsgBox.confirm('Approve resource?')) {
            entity.putAll(svc.approveResource(entity));
            caller.reload();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate resource?')) {
            entity.putAll(svc.deactivateResource(entity));
            caller.reload();
        }
    }
}