package comis.models;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.reports.*;


class ApplicationCashReceiptModel extends com.rameses.enterprise.treasury.cashreceipt.AbstractCashReceipt 
{
    @Binding
    def binding;
    
    @Service(value='ComisApplicationBillingRuleService', connection="comis")
    def billSvc;
    
    @Service('DateService')
    def dtSvc 
    
    def application;
    
    
    void init(){
        super.init();
        application = null;
        entity.amount = 0.0;
    }
            
    void calcReceiptAmount(){
        if (entity.amount == null) 
            entity.amount = 0.0
        updateBalances();
    }
     
    
    public void validateBeforePost() {
        super.validateBeforePost();
        if (!entity.application)
            throw new Exception('Application No. is required.');
    }
   
    
    def printDetail(){
        return InvokerUtil.lookupOpener('burialpermit:printdetail',[entity:entity])
    }
    
    
    def getLookupApplication(){
        return InvokerUtil.lookupOpener('burialpermitapplication:lookup',[
            onselect : {
                if ( it.state != 'FORPAYMENT') 
                    throw new Exception('Application has not yet been submitted for payment.');
                    
                if ( it.balance == 0) 
                    throw new Exception('Application has already been fully paid.');
                    
                application = it;
                entity.application = it;
                entity.payer = it.applicant;
                entity.paidby = it.applicant.name;
                entity.paidbyaddress = it.applicant.address;
                entity.bill = billSvc.getBilling(it);
                entity.items = buildItems(entity.bill);
                entity.amount = entity.items.amount.sum();
                listHandler.reload();
                updateBalances();
                binding?.refresh('entity.payer|entity.paidby.*');
                super.binding?.refresh('entity.payer|entity.paidby.*');
            },
            onempty: {
                application = null;
                calcReceiptAmount();
            }
        ])
    }    
    
    def buildItems(bill) {
        def rctitems = [];

        bill.items.each{ 
            rctitems << [
                item: it.item.item,
                amount: it.amount
            ]
            if (it.surcharge > 0) {
                rctitems << [
                    item: it.surchargeacct.item,
                    amount: it.surcharge,
                ]
            }
            if (it.penalty > 0) {
                rctitems << [
                    item: it.penaltyacct.item,
                    amount: it.penalty,
                ]
            }
        }
        return rctitems;
    }
    
    def listHandler = [
        fetchList: { entity.items }
    ] as BasicListModel
}

