package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.CrudFormModel;

class ApplicationModel extends CrudFormModel {
    @Service('ComisApplicationService')
    def svc;
    
    @Service(value='ReportParameterService', connection="etracs")
    def reportSvc;
    
    @Service('DateService')
    def dtSvc;
    
    def apptypes = ['NEW', 'RENEWAL'];
    def online = true;
    
    def initCapture() {
        online = false;
        return super.create();
    }
    
    boolean isShowConfirm() {
        return false;
    }
    
    def getRelations() {
        svc.getRelations();
    }
    
    void afterCreate() {
        def pdate = dtSvc.parseCurrentDate();
        entity.appyear = pdate.year;
        entity.dtapplied = pdate.date;
        entity.applicant = [:];
        entity.deceased = [:];
        entity.lessee = [:];
        entity.renewable = false;
        entity.online = online;
        entity.amount = 0;
        entity.amtpaid = 0;
        
        def params = reportSvc.getStandardParameter();
        entity.lessor = [:];
        entity.lessor.name = params.MAYORNAME;
        entity.lessor.title = params.MAYORTITLE;
        entity.lessor.ctcplaceissued = params.LGUADDRESS;
        entity.lessee.ctcplaceissued = params.LGUADDRESS;
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
            entity.putAll(svc.submitForApproval(entity));
        }
    }
    
    void approve() {
        if (MsgBox.confirm('Approve application?')) {
            entity.putAll(svc.approve(entity));
        }
    }
    
    def release() {
        if (MsgBox.confirm('Issue permit and release application?')) {
            entity.putAll(svc.release(entity));
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