package com.ekunt;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * 过滤器，配合请求封装器过滤修改请求参数
 * @author E-Kunt
 *
 */
@WebFilter(filterName="/EscapeFilter", urlPatterns={"/sendAndReadMessage.jsp"})
public class EscapeFilter implements Filter {

    public EscapeFilter() {
    }

    public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//用请求封装器封装请求后的对象，作为请求对象传到下个Filter或Servlet中
		EscapeWrapper escapeRequest = new EscapeWrapper((HttpServletRequest) request);
		chain.doFilter(escapeRequest, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
