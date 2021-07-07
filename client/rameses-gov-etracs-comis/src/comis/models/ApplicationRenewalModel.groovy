package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

class ApplicationRenewalModel  {
    @Binding
    def binding;
    
    @Invoker
    def invoker;

    @Service("ComisApplicationService")
    def appSvc;
    
    @FormTitle
    public String getTitle() {
        return "Application Renewal";
    }
    
    def entity = [:];
    
    def create() {
        def app = appSvc.renew(entity);
        def op = Inv.lookupOpener("application:open", [entity: app]);
        op.target = "topwindow";
        return op;
    }
    
    def getLookupApplication() {
        return Inv.lookupOpener("burialpermitapplication:lookup", [
            onselect: { app ->
                if (!app.state.matches('ACTIVE|EXPIRED'))
                    throw new Exception('Application must be in active or expired state.');
                
                entity.prevapp = app;
                entity.prevappid = app.objid;
                entity.applicant = app.applicant;
                entity.relation  = relations.find{it.objid == app.relation.objid};
                binding.refresh('entity.prevapp.*');
            },
            onempty: {
                entity.prevapp = [:];
                entity.prevappid = null;
                binding.refresh('entity.prevapp.*');
            }
        ]);
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
    
        
    def getRelations() {
        appSvc.getRelations();
    }
}
