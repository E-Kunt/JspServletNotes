package com.ekunt;

import java.io.IOException;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;

/**
 * 此类用来拓展代替ServletOutputStream类，使其具有GZIP压缩功能
 * @author E-Kunt
 *
 */
public class GZipServletOutputStream extends ServletOutputStream {

	/**
	 * GZIP压缩输出流
	 */
	private GZIPOutputStream gzipOutputStream;
	
	/**
	 * 构造方法，把原输出流包装为GZIP压缩输出流
	 * @param out
	 * @throws IOException
	 */
	public GZipServletOutputStream(ServletOutputStream out) throws IOException {
		this.gzipOutputStream = new GZIPOutputStream(out);
	}

	/**
	 * 使用压缩输出流进行输出
	 */
	@Override
	public void write(int b) throws IOException {
		gzipOutputStream.write(b);
	}

	/**
	 * 获得压缩输出流
	 * @return gzipOutputStream
	 */
	public GZIPOutputStream getGzipOutputStream() {
		return gzipOutputStream;
	}

	@Override
	public boolean isReady() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setWriteListener(WriteListener arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
