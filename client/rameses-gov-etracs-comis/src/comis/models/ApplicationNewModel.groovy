package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.util.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.enterprise.models.*;

class ApplicationNewModel  {
    @Invoker
    def invoker;

    @Service("ComisApplicationService")
    def appSvc;
    
    @FormTitle
    public String getTitle() {
        return "New Application";
    }

    def create() {
        def app = appSvc.create();
        def entity = [objid: app.objid ];            
        def op = Inv.lookupOpener("application:open", [entity:entity] );
        op.target = "topwindow";
        return op;
    }
    
}