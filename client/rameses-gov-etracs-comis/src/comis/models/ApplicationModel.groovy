package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;

class ApplicationModel extends AbstractApplicationModel {

    
    @Service('DateService')
    def dtSvc;

    def apptypes = ['NEW', 'RENEWAL'];
    
    boolean isShowConfirm() {
        return false;
    }
    
    def getRelations() {
        appSvc.getRelations();
    }
    
    void beforeSave(mode) {
        if (mode == 'create') return;
        required('Lessor Name', entity.lessor.name);
        required('Lessor Title', entity.lessor.title);
        required('Lessor CTC No.', entity.lessor.ctcno);
        required('Lessor CTC Place Issued', entity.lessor.ctcplaceissued);
        required('Lessor CTC Issue Date', entity.lessor.ctcdtissued);
        
        required('Lessee CTC No.', entity.lessee.ctcno);
        required('Lessee CTC Place Issued', entity.lessee.ctcplaceissued);
        required('Lessee CTC Issue Date', entity.lessee.ctcdtissued);
        
        required('1st Witness', entity.witness1);
        required('2nd Witness', entity.witness2);
    }
    
    def afterSaveDeceased = {deceased ->
        entity.deceased.putAll(deceased);
        binding.refresh("entity.deceased.*");
    }
    
    def openDeceased() {
        if (mode == 'create' && !entity.deceased.objid) {
            return Inv.lookupOpener("deceased:create", [afterSaveCallback: afterSaveDeceased])
        } else {
            return Inv.lookupOpener("deceased:open", [entity: entity.deceased, afterSaveCallback: afterSaveDeceased])
        }
    }
    
    def getLookupApplicant() {
        return Inv.lookupOpener("entity:lookup", [
                onselect: { 
                    entity.applicant = it;
                    entity.applicant.address = it.address.text.replaceAll('\n','');
                    binding.refresh('entity.lessee.*');
                },
                onempty: {
                    entity.applicant = [:];
                }
        ]);
    }
    
    def getResourceLookup() {
        return Inv.lookupOpener("cemetery_resource:lookup", [
                onselect: { 
                    if (it.appno) {
                        throw new Exception('Resource has already been allocated to Application No. ' + it.appno);
                    }
                    entity.resourceinfo = it;
                    binding.refresh('entity.resourceinfo.*');
                },
                onempty: {
                    entity.resourceinfo = [:];
                }
        ]);
    }
    

    def getAmount() {
        return entity.fees.total.sum();
    }
    
    void required(caption, value) {
        if (!value) throw new Exception(caption + ' is required.');
    }
}