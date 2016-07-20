package com.ekunt.application;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestApplication
 */
@WebServlet("/TestApplication")
public class TestApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestApplication() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String head;
		ServletContext context = request.getServletContext();
		Integer i = (Integer) context.getAttribute("i");
		if(i == null) {
			head = "Hello, new guy!";
			context.setAttribute("i", 0);
		} else {
			head = "Welcome back!";
			context.setAttribute("i", i.intValue()+1);
		}
		PrintWriter writer = response.getWriter();
		writer.println("<h1>" + head + "</h1>");
		writer.println("<br/> i:" + context.getAttribute("i"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
