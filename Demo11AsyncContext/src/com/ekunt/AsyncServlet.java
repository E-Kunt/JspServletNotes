package com.ekunt;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		name="AsyncServlet", 
		urlPatterns={"/AsyncServlet"}, 
		//首先告诉容器此Servlet支持异步处理
		asyncSupported = true)
public class AsyncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 创建一个线程池
	 */
	private ExecutorService executorService = Executors.newFixedThreadPool(10);
	
       
    public AsyncServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		//开始异步处理，释放请求线程
		AsyncContext ctx = request.startAsync();
		//创建处理线程，并调度线程
		executorService.submit(new AsyncRequest(ctx));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		//关闭线程池
		executorService.shutdown();
		super.destroy();
	}

}
