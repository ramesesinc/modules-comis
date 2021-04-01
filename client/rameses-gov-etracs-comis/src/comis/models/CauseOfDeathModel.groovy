package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class ResourceModel extends CrudFormModel {
    
    @Service('PersistenceService')
    def persistence;
    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterCreate() {
        entity.objid = null;
    }
    
    void afterSave() {
        caller.reload();
    }
    
    void approve() {
        if (MsgBox.confirm('Approve?')) {
            entity._schemaname = 'causeofdeath';
            entity.state = 'ACTIVE';
            persistence.update(entity);
            caller.reload();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate?')) {
            entity._schemaname = 'causeofdeath';
            entity.state = 'INACTIVE';
            persistence.update(entity);
            caller.reload();
        }
    }
}