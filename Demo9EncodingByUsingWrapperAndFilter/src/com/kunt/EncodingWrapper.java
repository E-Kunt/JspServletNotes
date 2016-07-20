package com.kunt;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 请求封装器，用于转换请求参数的编码
 * @author E-kunt
 *
 */
public class EncodingWrapper extends HttpServletRequestWrapper {

	/**
	 * 目标编码
	 */
	private String newEncode = null;
	
	/**
	 * 原来的编码
	 */
	private String oldEncode = null;
	
	/**
	 * 初始化编码
	 * @param request
	 * @param oldEncode
	 * @param newEncode
	 */
	public EncodingWrapper(HttpServletRequest request, String oldEncode, String newEncode) {
		super(request);
		this.oldEncode = oldEncode;
		this.newEncode = newEncode;
	}
	
	/**
	 * 转换参数值的编码
	 */
	@Override
	public String getParameter(String name) {
		String value = getRequest().getParameter(name);
		if(value != null) {
			try {
				byte[] bytes = value.getBytes(oldEncode);
				value = new String(bytes,newEncode);
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}
		return value;
	}
	
}
