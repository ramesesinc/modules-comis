package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.orisis2.common.*;
import com.rameses.orisis2.client.*;

class ApplicationCaptureFeeModel  {
    def entity;
    def onadd = {};
    
    void create() {
        entity = [
            amount: 0, 
            surcharge: 0, 
            penalty: 0, 
            amtpaid: 0,
            surchargepaid: 0,
            penaltypaid: 0,
            total: 0
        ];
    }
    
    def addFee() {
        if (entity.amount <= 0) 
            throw new Exception('Amount must be greater than zero');
            
        if (MsgBox.confirm('Add fee?')) {
            onadd(entity);
            return "_close";
        }
    }
    
    def getTotal() {
        entity.total = entity.amount + entity.surcharge + entity.penalty;
        return entity.total;
    }
    
}