package com.ekunt;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ForwardServlet")
public class ForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForwardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("此处：执行forward之前。"); //不会显示
		// out.flush(); 此处禁止flush()，否则会抛IllegalStateException
		request.getRequestDispatcher("target.jsp").forward(request, response);
		out.println("此处：执行forward之后。"); //不会显示

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
