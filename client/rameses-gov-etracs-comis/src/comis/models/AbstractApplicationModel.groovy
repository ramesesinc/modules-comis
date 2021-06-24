package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;

class AbstractApplicationModel extends WorkflowTaskModel {

    @Service('ComisApplicationService')
    def appSvc;
    
    @Service(value='ReportParameterService', connection="etracs")
    def reportSvc;

    
    public String getCaption() {
        return invoker.properties.caption;        
    }
    
    public String getWindowTitle() {
        return  (entity.appno==null? entity.trackingno : entity.appno);
    }
    
    public String getNotificationid() {
        return workunit?.info?.workunit_properties?.notificationid;
    }
    
    public String getSchemaName() {
        return workunit?.info?.workunit_properties?.schemaName;        
    }
    
    public boolean getCanChangeAssignee() {
        return false;
    }

    public boolean isCreateAllowed() {
        return true;
    }
    
    public boolean isEditAllowed() {
        return true;
    }

}