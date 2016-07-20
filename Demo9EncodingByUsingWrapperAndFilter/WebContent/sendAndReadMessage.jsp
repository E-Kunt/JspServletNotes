<%--再未使用请求封装器搭配过滤器之前，此JSP留言板的留言编码有误，显示乱码--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = "";
	if(request.getParameter("action") != null && request.getParameter("action").equals("action")) {
		message = request.getParameter("message");
		if(message.equals("")) {
			out.append("<script type='text/javascript'>alert('留言内容不能为空！');</script>");
		}
	}
	
	String dateTime = new java.text.SimpleDateFormat("yyyy-MM-ss hh:mm:ss").format(new java.util.Date());
%>    
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言板</title>
</head>
<body>
<form action="sendAndReadMessage.jsp" method="post">
	<input type="hidden" name="action" value="action"/>
	<textarea name="message" rows="3" cols="30"></textarea><br/>
	<input type="submit" name="submit" value="确定发布">
</form>
<br/>
<% if(message != "") { %>

---游客   <%=dateTime%> <br/>
<%=message %>

<%} %>
</body>
</html>