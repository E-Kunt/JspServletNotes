package com.ekunt.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Demo")
public class Demo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Demo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<!Doctype html><html xmlns=http://www.w3.org/1999/xhtml>"
				+ "<head><title>通过Request读取所有参数 </title></head>"
				+ "<body><table bgcolor = 'pink' align='center' border='2px'>"
				+ "<tr><th colspan='2'>通过Request读取的所有参数如下 </th></tr>");
		Map<String, String[]> parameters = request.getParameterMap();
		for (String key : parameters.keySet()) {
			String[] values = parameters.get(key);
			for(int i = 0; i < values.length; i++) {
				out.append("<tr><td>" + key + "</td>");
				out.append("<td>" + values[i] + "</td><tr>");
			}
			
		}
		out.append("</table></body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
