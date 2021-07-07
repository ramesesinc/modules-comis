package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.FormReportModel;

class CemeteryFilterReportModel extends FormReportModel {
    @Service('QueryService')
    def querySvc;
    
    def getCemeteries() {
        return querySvc.getList([
                _schemaname: 'cemetery',
                where: ['1=1'],
                orderBy: 'name'
        ]);
    }
    
    def getSections() {
        if (!query.cemetery) {
            return [];
        }
        
        return querySvc.getList([
                _schemaname: 'cemetery_section',
                findBy: [parentid: query.cemetery.objid],
                orderBy: 'name'
        ])
    }
    
    def getBlocks() {
        if (!query.section) {
            return [];
        }
        
        return querySvc.getList([
                _schemaname: 'cemetery_block',
                findBy: [parentid: query.section.objid],
                orderBy: 'name',
                debug: true,
        ])
    }
}