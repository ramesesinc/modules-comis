package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.CrudFormModel;

class ApplicationModel extends CrudFormModel {
    @Service('ComisApplicationService')
    def svc;
    
    @Service('DateService')
    def dtSvc;
    
    def apptypes = ['NEW', 'RENEW'];
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
        entity.renewable = false;
        entity.online = online;
        entity.amount = 0;
        entity.amtpaid = 0;
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
                    entity.applicant.address = it.address.text;
                },
                onempty: {
                    entity.applicant = [:];
                }
        ])
    }
    

    def getAmount() {
        return entity.fees.amount.sum();
    }
    
    def getAmtpaid() {
        return entity.fees.amtpaid.sum();
    }
}