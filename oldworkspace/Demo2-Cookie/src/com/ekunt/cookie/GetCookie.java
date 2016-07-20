package com.ekunt.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetCookie
 */
@WebServlet("/GetCookie")
public class GetCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCookie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<!Doctype html><html xmlns=http://www.w3.org/1999/xhtml>"
				+ "<head><title>通过Request读取所有Cookie </title></head>"
				+ "<body><table bgcolor = 'pink' align='center' border='2px'>"
				+ "<tr><th colspan='5'>通过Request读取的所有Cookie如下 </th></tr>");
		
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies) {
			out.append("<tr><td>" + cookie.getName() + "</td>");
			out.append("<td>" + cookie.getValue() + "</td>");
			out.append("<td>" + cookie.getMaxAge() + "</td>");
			out.append("<td>" + cookie.getSecure() + "</td>");
			out.append("<td>" + cookie.getPath()+ "</td><tr>");
			
		}
		out.append("</table></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
