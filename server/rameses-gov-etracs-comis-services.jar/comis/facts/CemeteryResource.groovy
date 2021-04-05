package comis.facts;

import java.util.*;

public class CemeteryResource {
	String objid;
	String resourceid;
	double areasqm;
	
	public CemeteryResource() {}

	public CemeteryResource(info) {
		this.objid = info.objid;
		this.resourceid = info.resource.objid;
		this.areasqm = info.areasqm;
	}

}


