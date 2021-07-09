package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

class ApplicationTransferModel  {
    @Binding
    def binding;
    
    @Invoker
    def invoker;

    @Service("ComisApplicationService")
    def appSvc;
    
    @FormTitle
    public String getTitle() {
        return "Application Transfer";
    }
    
    def entity = [:];
    
    def create() {
        def app = appSvc.transfer(entity);
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
                binding.refresh('entity.prevapp.*');
            },
            onempty: {
                entity.prevapp = [:];
                entity.prevappid = null;
                binding.refresh('entity.prevapp.*');
            }
        ]);
    }
    
    def getLookupResourceInfo() {
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
}
