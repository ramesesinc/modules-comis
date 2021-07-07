package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudFormModel;

class DeceasedModel extends CrudFormModel {
    @Service('ComisDeceasedPersonService')
    def svc;
    
    def afterSaveCallback = {};
    
    def agetypes = ['DAY', 'MONTH', 'YEAR'];
    def sexes = ['MALE', 'FEMALE'];
    def permissiontypes = ['INTER', 'DISINTER', 'REMOVE'];
    
    def getNationalities() {
        return svc.getNationalities();
    }
    
    def getLgus() {
        return svc.getLgus();
    }
    
    void afterCreate() {
        entity.state = 'DRAFT';
        entity.permissiontype = 'INTER';
        entity.nationality = 'FILIPINO';
        entity.sex = 'MALE';
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