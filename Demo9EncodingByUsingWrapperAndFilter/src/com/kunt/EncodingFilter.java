package com.kunt;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

@WebFilter(
		filterName = "/EncodingFilter", 
		urlPatterns = { "/*" }, 
		initParams = {
			@WebInitParam(name = "oldEncode", value = "ISO-8859-1"),
			@WebInitParam(name = "newEncode", value = "UTF-8") 
			}
		)
public class EncodingFilter implements Filter {

	/**
	 * 目标编码
	 */
	private String newEncode = null;
	
	/**
	 * 原来的编码
	 */
	private String oldEncode = null;
	
	
	public EncodingFilter() {
	}

	public void destroy() {
	}

	/**
	 * 根据请求的方式，确定是否使用请求封装器。
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if("POST".equals(req.getMethod())) {
			req.setCharacterEncoding(newEncode);
		} else {
			req = new EncodingWrapper(req,oldEncode,newEncode);
		}
		chain.doFilter(req, response);
		
	}

	/**
	 * 获得初始参数
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.oldEncode = fConfig.getInitParameter("oldEncode");
		this.newEncode = fConfig.getInitParameter("newEncode");
	}

}
