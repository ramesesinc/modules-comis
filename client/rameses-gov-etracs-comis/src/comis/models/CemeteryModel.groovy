package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.CrudFormModel;

class CemeteryModel extends CrudFormModel {
    @Binding
    def binding;
    
    @Service('ComisCemeteryService')
    def svc;
    
    def sections;
    
    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterInit(){
        sections = svc.getSections(entity);
    }
    
    void afterCreate(){
        sections = [];
    }
    
    void approve() {
        if (MsgBox.confirm('Approve cemtery?')) {
            entity.putAll(svc.approve(entity));
            refresh();
        }
    }
    
    void deactivate() {
        if (MsgBox.confirm('Deactivate cemetery?')) {
            entity.putAll(svc.deactivate(entity));
            refresh();
        }
    }    
    

    /*==============================
     * SECTIONS SUPPORT 
     * ============================*/
    def refreshSections = {
        sections = svc.getSections(entity);
        binding.refresh("selectedSection");
    }
    
    def getSectionsOpener() {
        return Inv.lookupOpener('cemetery_sections:view', [cemetery: entity, refreshSections: refreshSections]);
    }
    
    
    /*==============================
     * RESOURCE SUPPORT 
     * ============================*/
    def selectedSection;
    
    def getResourceOpener() {
        return Inv.lookupOpener('cemetery_section_resources:view', [section: selectedSection])
    }
}