package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.CrudFormModel;
import system.explorer.*;

class CemeteryModel extends CrudFormModel {
    @Binding
    def binding;
    
    @Service('ComisCemeteryService')
    def svc;

    
    boolean isShowConfirm() {
        return false;
    }
    
    void afterCreate(){
        entity.isnew = true;
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


    /* SECTIONS */
    def selectedSection;

    def getSectionsOpener() {
        return Inv.lookupOpener('cemetery_section:list', [parent: entity])
    }

    void setSection(section) {
        selectedSection = section;
        if (!section) {
            selectedBlock = null;
            selectedResource = null;
        }
        binding.refresh("selectedBlock|selectedResource");
    }

    /* BLOCKS */
    def selectedBlock;

    def getBlocksOpener() {
        if (selectedSection) {
            return Inv.lookupOpener('cemetery_block:list', [parent: selectedSection])
        }
        return null;
    }

    void setBlock(block) {
        selectedBlock = block;
        binding.refresh("selectedResource")
    }

    /* RESOURCES */
    def selectedResource;

    def getResourcesOpener() {
        if (selectedBlock) {
            return Inv.lookupOpener('cemetery_resource:list', [parent: selectedBlock])
        }
        return null;
    }

    void setResource(resource) {
        selectedResource = resource;
    }
}