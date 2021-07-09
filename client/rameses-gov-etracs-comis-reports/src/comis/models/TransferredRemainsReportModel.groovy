package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.FormReportModel;

class TransferredRemainsReportModel extends PeriodFilterReportModel {
    def query() {
        def query = getQuery();
        query.period = 'YEAR';
        query.year = dtSvc.getServerYear();
        return super.query();
    }
}