package com.ekunt.cookie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCookie
 */
@WebServlet("/SetCookie")
public class SetCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SetCookie() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		for(int i=1;i<4;i++) {
			//依赖于浏览器的Cookie,关闭窗口会自动清除
			Cookie cookie1 = new Cookie("Session-Cookie-" + i, "value-" + i);
			response.addCookie(cookie1);
			
			//写入文件的Cookie,超过设置的时间才会清除
			Cookie cookie2 = new Cookie("Persistent-Cookie-" + i, "value-" + i);
			cookie2.setMaxAge(3600);
			response.addCookie(cookie2);
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<html><head><title>已写入cookie</title></head><body>已写入cookie</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
