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
    
    def sections = [];
    def resources = [];
    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterInit(){
        sections = svc.getSections(entity);
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
    
    void refresh() {
        binding.refresh("sections");
    }
    
    def getSectionsOpener() {
        return Inv.lookupOpener('cemetery_sections:view', [cemetery: entity])
    }
    
//    
//    
//    
//    
//    
//    /*=====================================
//    **
//    **  SECTION SUPPORT 
//    **
//    =======================================*/
//    
//    def selectedSection;
//    
//    void setSelectedSection( selectedSection ) {
//        this.selectedSection = selectedSection;
//        resources = [];
//        if (selectedSection) {
//            resources = svc.getSectionResources(selectedSection);
//        }
//        resourceListHandler.reload();
//    }
//    
//    void refresh() {
//        sections = sections = svc.getSections(entity);
//        sectionListHandler.reload();
//    }
//    
//    def sectionListHandler = [
//        fetchList: { sections }
//    ] as BasicListModel;
//    
//    def newSection() {
//        return Inv.lookupOpener("cemetery_section:create", [:]);
//    }
//    
//    def openSection() {
//        return Inv.lookupOpener("cemetery_section:open", [entity: selectedSection]);
//    }
//    
//    void deleteSection() {
//        if (MsgBox.confirm('Delete section?')) {
//            svc.deleteSection(selectedSection);
//            refresh();
//        }
//    }
//
//    
//    /*=====================================
//    **
//    **  SECTION RESOURCE SUPPORT 
//    **
//    =======================================*/
//    def selectedResource;
//    
//    void refreshResources() {
//        resources = [];
//        if (selectedSection) {
//            resources = svc.getSectionResources(selectedSection);
//        }
//        resourceListHandler.reload();
//    }
//    
//    def resourceListHandler = [
//        fetchList: { resources }
//    ] as BasicListModel;
//    
//    def newResource() {
//        return Inv.lookupOpener("cemetery_section_resource:create", [:]);
//    }
//    
//    def openResource() {
//        return Inv.lookupOpener("cemetery_section_resource:open", [entity: selectedResource]);
//    }
//    
//    void deleteResource() {
//        if (MsgBox.confirm('Delete section?')) {
//            svc.deleteSectionResource(selectedResource);
//            refreshResources();
//        }
//    }
//
//    
}