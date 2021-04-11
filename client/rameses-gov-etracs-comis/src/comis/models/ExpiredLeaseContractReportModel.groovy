package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.FormReportModel;

class ExpiredLeaseContractReportModel extends FormReportModel {
    @Service('QueryService')
    def querySvc;
    
    def getCemeteries() {
        return querySvc.getList([
                _schemaname: 'cemetery',
                where: ['1=1'],
                orderBy: 'name'
        ])
    }
}