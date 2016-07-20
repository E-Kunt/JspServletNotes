package com.ekunt;

import java.io.IOException;
import java.util.zip.GZIPOutputStream;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * GZip压缩过滤器
 * @author E-Kunt
 *
 */
@WebFilter(filterName="/GZipFilter", urlPatterns={"/*"})
public class GZipFilter implements Filter {

    public GZipFilter() {
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse) response;
		//检查浏览器是否支持GZip压缩编码
		String encodings = req.getHeader("accept-encoding");
		if((encodings != null) && (encodings.indexOf("gzip") > -1)) {
			GZipWrapper wrapper = new GZipWrapper(res);
			wrapper.setHeader("content-encoding", "gzip");
			
			chain.doFilter(request, wrapper);
			
			//必须finish压缩流 （Servlet中还必须close输出流）
			GZIPOutputStream stream = wrapper.getGZIPOutputSteam();
			if(stream != null){
				stream.finish();
			}
						
		}else {
			//不支持则不压缩
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void destroy() {
	}
}
