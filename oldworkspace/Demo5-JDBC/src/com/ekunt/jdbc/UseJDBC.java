package com.ekunt.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UseJDBC
 */
@WebServlet("/UseJDBC")
public class UseJDBC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UseJDBC() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		writer.println("<html><head><title>获取数据库的数据</title></head><body><table border='2'><tr><td>Id</td><td>title</td></tr>");
		
		Connection conn = null;
	    PreparedStatement pstat = null;
		ResultSet rs = null;
		
		try {
			//驱动包要放在WEB-INF下的lib文件夹中
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/mydata?user=root&password=tiger");
			pstat = conn.prepareStatement("select * from article");
			rs = pstat.executeQuery();
			while(rs.next()) {
				writer.print("<tr>");
				writer.print("<td>" + rs.getInt("id") + "</td>");
				writer.print("<td>" + rs.getString("title") + "</td>");
				writer.print("</tr>");
			}
			writer.println("</table></body></html>");
			
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
					rs = null;
				}
				if(pstat != null) {
					pstat.close();
					pstat = null;
				}
				if(conn != null) {
					conn.close();
					conn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
