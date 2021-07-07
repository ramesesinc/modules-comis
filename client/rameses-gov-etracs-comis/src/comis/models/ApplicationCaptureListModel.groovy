package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.CrudListModel;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

class ApplicationCaptureListModel extends CrudListModel {
    public String getEntitySchemaName() {
        return "application";
    }
    
    def open() {
        if ( !isOpenAllowed() )
            throw new Exception("Open not allowed");
        if( !selectedItem ) 
            throw new Exception("Please select an item");
            
        def d = null;
        def p = [ schemaName:'application', adapter:adapter, entity: selectedItem];
        p.title = "Open " + workunit.title;
        try {
            d = Inv.lookupOpener( "application_capture:open", p );
        }
        catch(e) {
            //d = Inv.lookupOpener( "crudform:open", p );
            e.printStackTrace();
        }
        if(!d) throw new Exception("No handler found for application_capture:open. Please check permission");
        if( !d.target ) d.target = 'window';
        return d;
    }
    

}