package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;

class ApplicationModel extends AbstractApplicationModel {

    
    @Service('DateService')
    def dtSvc;

    boolean isShowConfirm() {
        return false;
    }
    
    def getRelations() {
        appSvc.getRelations();
    }
    
    void beforeSave(mode) {
        if (mode == 'create' && entity.apptype == 'RENEWAL')
            return;
        
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
    
    void submitForApproval() {
        if (MsgBox.confirm('Submit for approval?')) {
            entity.putAll(appSvc.submitForApproval(entity));
        }
    }
    
    void approve() {
        if (MsgBox.confirm('Approve application?')) {
            entity.putAll(appSvc.approve(entity));
        }
    }
    
    def release() {
        if (MsgBox.confirm('Issue permit and release application?')) {
            entity.putAll(appSvc.release(entity));
        }
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
    

    def getAmount() {
        return entity.fees.amount.sum();
    }
    
    def getAmtpaid() {
        return entity.fees.amtpaid.sum();
    }
    
    void required(caption, value) {
        if (!value) throw new Exception(caption + ' is required.');
    }
}