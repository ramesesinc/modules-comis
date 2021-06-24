package comis.actions;

import com.rameses.rules.common.*;
import com.rameses.util.*;
import comis.facts.*;

public class AddFee implements RuleActionHandler {
	public void execute(def params, def drools) {
		def app = params.application;
		def itemaccount = params.itemaccount;

		println 'itemaccount => ' + itemaccount;
		println 'app.fees => ' + app.fees;

		def fee = app.fees.find{it.item.objid == itemaccount.objid};
		if (!fee) {
			fee = [:];
			fee.objid = 'AI' + new java.rmi.server.UID();
			fee.parentid = app.objid;
			fee.item = [objid: itemaccount.key];
			fee.amtpaid = 0.0;
			app.fees << fee;
		}
		fee.amount = params.expr.decimalValue;
	}
}