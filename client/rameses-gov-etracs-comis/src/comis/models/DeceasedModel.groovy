package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class DeceasedModel extends CrudFormModel {
    @Service('DeceasedPersonService')
    def svc;
    
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
    
}