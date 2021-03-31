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
    
    void approve() {
        if (MsgBox.confirm('Approve resource?')) {
            entity._schemaname = 'resource';
            entity.state = 'ACTIVE';
            persistence.update(entity);
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate resource?')) {
            entity._schemaname = 'resource';
            entity.state = 'INACTIVE';
            persistence.update(entity);
        }
    }
}