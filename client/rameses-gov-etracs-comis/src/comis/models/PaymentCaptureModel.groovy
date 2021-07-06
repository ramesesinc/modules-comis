package comis.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.orisis2.common.*;
import com.rameses.orisis2.client.*;

class PaymentCaptureModel  {
    def entity;
    def onadd = {};
    
    void create() {
        entity = [
            reftype: 'RECEIPT',
            txnmode: 'CAPTURE',
            discount: 0,
            amount: entity.amount,
            voided: 0,
        ];
    }
    
    def post() {
        if (MsgBox.confirm("Post payment?")) {
            onadd(entity);
            return "_close";
        }
    }
    
}