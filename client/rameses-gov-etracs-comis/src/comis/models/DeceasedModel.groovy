package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class DeceasedModel extends CrudFormModel {
    @Service('ComisDeceasedPersonService')
    def svc;
    
    def afterSaveCallback = {};
    
    def sexes = ['MALE', 'FEMALE'];
    
    def getNationalities() {
        return svc.getNationalities();
    }
    
    def getCauseofdeaths() {
        return svc.getCauseofdeaths();
    }
    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterSave() {
        afterSaveCallback(entity);
    }
    
}