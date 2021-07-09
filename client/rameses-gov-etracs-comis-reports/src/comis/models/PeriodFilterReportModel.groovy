package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.FormReportModel;

class PeriodFilterReportModel extends FormReportModel {
    @Service('DateService')
    def dtSvc;
    
    def periods = ['YEAR', 'QUARTER', 'MONTH'];
    def quarters = [1,2,3,4];
    
    def getMonths() {
        return dtSvc.getMonths();
    }
    
}