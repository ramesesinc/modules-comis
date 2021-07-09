package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.FormReportModel;

class DeceasedListReportModel extends PeriodFilterReportModel {
    @Service('QueryService')
    def querySvc;
    
    def agegroups = [
        [id: 'infant', caption: '0 TO 11 MONTHS'],
        [id: '18below', caption: '18 YEARS OLD AND BELOW'],
        [id: '60above', caption: '60 YEARS OLD AND ABOVE'],
        [id: 'range', caption: 'Range'],
    ]
    
    def agetypes = ['DAY', 'MONTH', 'YEAR'];
    
    def getLgus() {
        return querySvc.getList([
            _schemaname: 'lgu',
            where: ['1=1'],
        ])
    }
    
    def init() {
        def query = getQuery();
        query.period = 'YEAR';
        query.year = dtSvc.getServerYear();
        query.agegroup = agegroups.find{it.id == '18bleow'};
        return super.query();
    }
}