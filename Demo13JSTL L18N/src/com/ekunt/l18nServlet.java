package com.ekunt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/l18nServlet")
public class l18nServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public l18nServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Locale local = new Locale("zh", "CN");
		ResourceBundle res = ResourceBundle.getBundle("messages", local);
		out.println("-------基本信息------<br/> ");
		out.println("--姓名：" + res.getString("com.ekunt.name") + "<br/>");
		out.println("--性别： " + res.getString("com.ekunt.sex") + "<br/>");
		out.println("--年龄： " + res.getString("com.ekunt.age") + "<br/>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
