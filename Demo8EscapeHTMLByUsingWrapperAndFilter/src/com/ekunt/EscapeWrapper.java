package com.ekunt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 请求封装器，重写getParameter()方法，替代HTML的尖括号字符
 * @author E-kunt
 *
 */
public class EscapeWrapper extends HttpServletRequestWrapper {

	public EscapeWrapper(HttpServletRequest request) {
		//必须调用父类构造器
		super(request);
	}

	@Override
	public String getParameter(String name) {
		//替代HTML的尖括号字符
		String value = getRequest().getParameter(name);
		if (value == null)
			return value;
		return value.replace("<", "&lt").replace(">", "&gt");
	}

}
