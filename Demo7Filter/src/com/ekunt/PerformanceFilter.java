package com.ekunt;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * 计算从请求到响应的时间差的过滤器组件
 * @author E-Kunt
 *
 */
@WebFilter(
		filterName="/PerformanceFilter",
		//过滤指定的请求URL或指定Servlet
		urlPatterns={"/*"},  /*或者servletNames={"*"}*/ 
		//使请求包含、转发等时仍然可用过滤器
		dispatcherTypes= {
				DispatcherType.REQUEST,
				DispatcherType.INCLUDE,
				DispatcherType.FORWARD,
				DispatcherType.ERROR,
				DispatcherType.ASYNC
			}
		)
public class PerformanceFilter implements Filter {
	private FilterConfig config = null;

    public PerformanceFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//在执行servers()之前执行
		long begin = System.currentTimeMillis();
		
		//----分界点，传递到下个Filter或Servlet---------------
		chain.doFilter(request, response);
		//-----------------------------------
		
		//在执行servers()之后执行（多个过滤器时按堆栈顺序返回执行）
		long end = System.currentTimeMillis();
		config.getServletContext().log("从请求到响应的时间差：" + (end-begin)/1000 + "秒");
		response.getWriter().println("从请求到响应的时间差：" + (end-begin)/1000 + "秒"); //会成功输出到页面
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}

}
