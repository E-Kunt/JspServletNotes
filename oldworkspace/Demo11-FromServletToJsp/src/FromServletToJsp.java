

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FromServletToJsp
 */
@WebServlet("/FromServletToJsp")
public class FromServletToJsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FromServletToJsp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//使用forward的方式跳转到JSP页面
		request.setAttribute("name", "ekunt");
		this.getServletConfig().getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
		
		//使用sendRedirect方法跳转到JSP页面
		//response.sendRedirect("result.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
