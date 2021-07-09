package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

class ApplicationCaptureModel extends CrudFormModel {
    @Service('ComisApplicationService')
    def appSvc;
    
    @Service("DateService")
    def dtSvc;

    @Service("ReportParameterService")
    def reportSvc;
    
    @FormTitle
    public String getTitle() {
        return "Capture Application";
    }
    
    def apptypes = ['NEW', 'RENEWAL', 'TRANSFER'];
    
    boolean isShowConfirm() {
        return false;
    }
    
    def getRelations() {
        appSvc.getRelations();
    }

    void afterCreate() {
        def pdate = dtSvc.parseCurrentDate();
        entity.appyear = pdate.year;
        entity.dtapplied = pdate.date;
        entity.applicant = [:];
        entity.deceased = [:];
        entity.lessee = [:];
        entity.renewable = false;
        entity.online = false;
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
    
    void approve() {
        if (MsgBox.confirm('Approve?')) {
            entity.putAll(appSvc.approve(entity));
        }
    }
    
    
    public boolean beforeRemoveItem(String name, def item ) {
        return MsgBox.confirm("Remove selected item?");
    }
    
    def addFee() {
        def onadd = {fee ->
            fee.parentid = entity.objid;
            addItem("fees", fee);
            entity.amount = entity.fees.sum{ it.amount + it.surcharge + it.penalty }
            binding.refresh("selectedFee|amount");
        }
        return Inv.lookupOpener('application_fee:create', [onadd: onadd]);
    }
    
    
    def addPayment() {
        def onadd = {payment ->
            payment.appid = entity.objid;
            appSvc.postCapturePayment(payment);
            addItem("payments", payment);
            entity.amtpaid += payment.amount;
            entity.balance = entity.amount - entity.amtpaid;
            itemHandlers.payments.handler.reload();
        }
        return Inv.lookupOpener('payment_capture:create', [onadd: onadd]);
    }
}