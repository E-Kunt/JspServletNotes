package com.ekunt.tag;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ForEachTag extends SimpleTagSupport {
	private String var;
	private Collection items;
	
	public void setVar(String var) {
		this.var = var;
	}
	
	public void setItems(Collection items) {
		this.items = items;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		for(Object o : items) {
			this.getJspContext().setAttribute(var, o);
			this.getJspBody().invoke(null);
			this.getJspContext().removeAttribute(var);
		}
	}
}
