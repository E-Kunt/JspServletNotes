package com.kunt;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns={"/MailServlet"},
		initParams={
			@WebInitParam(name = "mailHost", value = "smtp.sina.com.cn"),
			@WebInitParam(name = "mailPort", value = "25"),
			@WebInitParam(name = "username", value = "wyk731497361@sina.com"),
			@WebInitParam(name = "password", value = "yikun19941108.")
		}
	)
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String mailHost;
	private String mailPort;
	private String userName;
	private String password;
	private Properties props;
    
    public MailServlet() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	mailHost = getInitParameter("mailHost");
    	mailPort = getInitParameter("mailPort");
    	userName = getInitParameter("username");
    	password = getInitParameter("password");
    	
    	//第一步：准备Property
    	props = new Properties();
    	props.put("mail.smtp.host", mailHost);
    	props.put("mail.smtp.port", mailPort);
    	props.put("mail.smtp.auth", "true");
    	//props.put("mail.smtp.socketFactory.class",
    	//		"javax.net.ssl.SSLSocketFactory");
    	//props.put("mail.smtp.socketFactory.fallback", "false");
    	//props.put("mail.smtp.socketFactory.port", mailPort);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("error!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String text = request.getParameter("text");

		try {
			//第二步：准备Session
			Session session = Session.getDefaultInstance(props,
				new Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(userName, password);
						};
				}
			);
			
			//第三步：准备Message
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(subject);
			msg.setText(text);
			msg.setSentDate(new Date());
			
			//第四步：发送邮件
			Transport.send(msg);
		} catch (AddressException e) {
			response.getWriter().println("发送失败！");
			e.printStackTrace();
			return;
		} catch (MessagingException e) {
			response.getWriter().println("发送失败！");
			e.printStackTrace();
			return;
		}
		
		response.getWriter().println("发送成功！");
		
	}

}
