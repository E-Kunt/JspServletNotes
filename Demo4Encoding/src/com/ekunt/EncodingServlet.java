package com.ekunt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EncodingServlet")
public class EncodingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EncodingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//万能的编码处理方式
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(name);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//只能对消息体起作用，故只能用于POST方式才有效
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		System.out.println(name);
	}

}
