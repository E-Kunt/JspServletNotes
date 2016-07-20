package com.ekunt;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * 响应封装器，将响应的流对象拓展为具有压缩功能的流对象
 * @author E-Kunt
 *
 */
public class GZipWrapper extends HttpServletResponseWrapper {
	/**
	 * 用于替换的压缩输出字节流
	 */
	private GZipServletOutputStream gzServletOutputSteam;
	/**
	 * 用于替换的压缩输出字符流
	 */
	private PrintWriter gzipPrintWriter;

	public GZipWrapper(HttpServletResponse response) {
		super(response);
	}
	
	/**
	 * 重写此方法，使其返回的字节流具有压缩功能
	 */
	@Override
	public ServletOutputStream getOutputStream() throws IOException {
		//已调用过getWriter()时，再调用getOutputStream()就抛异常
		if(gzipPrintWriter != null) {
			throw new IllegalStateException();
		}
		//把原字节流包装成压缩字节流并返回
		if(gzServletOutputSteam == null) {
			gzServletOutputSteam = new GZipServletOutputStream(getResponse().getOutputStream());
		}
		return gzServletOutputSteam;
	}
	
	/**
	 * 重写此方法，使其返回的字符流具有压缩功能
	 */
	@Override
	public PrintWriter getWriter() throws IOException {
		// 已调用过getOutputStream()时，再调用getWriter()就抛异常
		if (gzServletOutputSteam != null) {
			throw new IllegalStateException();
		}
		if(gzipPrintWriter == null) {
			gzServletOutputSteam = new GZipServletOutputStream(getResponse().getOutputStream());
			OutputStreamWriter out = new OutputStreamWriter(gzServletOutputSteam, getResponse().getCharacterEncoding());
			gzipPrintWriter = new PrintWriter(out);
		}
		return gzipPrintWriter;
	}

	/**
	 * 不实现此方法，因为真正的输出会被压缩
	 */
	@Override
	public void setContentLength(int len) {
		
	}
	
	public GZIPOutputStream getGZIPOutputSteam() {
		if(this.gzServletOutputSteam == null) {
			return null;
		}
		return this.gzServletOutputSteam.getGzipOutputStream();
	}
	
}
