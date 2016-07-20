package com.ekunt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ekunt.util.DB;

/**
 * Servlet implementation class User
 */
@WebServlet("/User")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public User() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gbk");
		PrintWriter writer = response.getWriter();
		writer.println("<html><head><title>使用JavaBean获取数据库的数据</title></head><body><table border='2'><tr><td>Id</td><td>title</td></tr>");
		
		Connection conn = DB.getConnection();
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, "select * from article");
		try {
			while(rs.next()) {
				writer.print("<tr>");
				writer.print("<td>" + rs.getInt("id") + "</td>");
				writer.print("<td>" + rs.getString("title") + "</td>");
				writer.print("</tr>");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		writer.println("</table></body></html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
