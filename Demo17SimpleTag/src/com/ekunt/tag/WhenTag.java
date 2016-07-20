package com.ekunt.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class WhenTag extends SimpleTagSupport {
	private boolean test;
	
	public void setTest(boolean test) {
		this.test = test;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		JspTag parent = getParent();
		if(!(parent instanceof ChooseTag)) {
			throw new JspTagException("this tag must be in the body of choose tag!");
		}
		
		ChooseTag choose = (ChooseTag) parent;
		if(!choose.isMatched() && test) {
			choose.setMatched(true);
			this.getJspBody().invoke(null);
		}
	}
}
