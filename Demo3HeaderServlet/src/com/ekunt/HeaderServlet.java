package com.ekunt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Header.view")
public class HeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeaderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Enumeration<String> e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			String name = e.nextElement();
			out.println(name + " : " + request.getHeader(name));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
