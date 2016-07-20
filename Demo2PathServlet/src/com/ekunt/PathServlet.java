package com.ekunt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet/*")
public class PathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PathServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("【RequestURL】 " + request.getRequestURL());
		out.println("【RequestURI】 " + request.getRequestURI());
		out.println("【ContextPath】 " + request.getContextPath());
		out.println("【ServletPath】 " + request.getServletPath());
		out.println("【PathInfo】 " + request.getPathInfo());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
