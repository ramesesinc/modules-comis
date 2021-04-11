package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

class ApplicationRenewalModel extends ApplicationModel {
    
    void afterCreate() {
        def params = reportSvc.getStandardParameter();
        def pdate = dtSvc.parseCurrentDate();
        
        entity.online = true;
        entity.appyear = pdate.year;
        entity.dtapplied = pdate.date;
        entity.apptype = 'RENEWAL';
        entity.applicant = [:];
        entity.lessor = [:];
        entity.lessor.name = params.MAYORNAME;
        entity.lessor.title = params.MAYORTITLE;
        entity.lessor.ctcplaceissued = params.LGUADDRESS;
        entity.lessee.ctcplaceissued = params.LGUADDRESS;
    }
    
    
    def getLookupApplication() {
        return Inv.lookupOpener("burialpermitapplication:lookup", [
            onselect: { 
                if (!it.state.matches('ACTIVE|EXPIRED'))
                    throw new Exception('Application must be in active or expired state.');

                entity.prevapp = it;
                entity.prevappid = it.objid;
                println entity.prevapp
                binding.refresh('entity.prevapp.*');
            },
            onempty: {
                entity.prevapp = [:];
                entity.prevappid = null;
                binding.refresh('entity.prevapp.*');
            }
        ]);
    }
    

}