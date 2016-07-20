package com.ekunt;

import java.io.IOException;

import javax.servlet.AsyncContext;

public class AsyncRequest implements Runnable{

	private AsyncContext ctx;
	
	/**
	 * 必须获得AsyncContext
	 * @param ctx
	 */
	public AsyncRequest(AsyncContext ctx) {
		this.ctx = ctx;
	}

	@Override
	public void run() {
		try {
			//模拟耗时操作
			Thread.sleep(5000);
			//输出结果
			ctx.getResponse().getWriter().println("操作成功！久等了！");
			//对客户端完成响应
			ctx.complete();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
