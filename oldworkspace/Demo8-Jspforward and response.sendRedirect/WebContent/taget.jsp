<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>原页面已跳转到此taget.jsp页面。</h1>

	<h2>
		<br /> name:
		<%=request.getParameter("name")%>
		<br /> old name :
		<%=request.getParameter("oldname")%>
		<br /> role :
		<%=request.getParameter("role")%>
		<br /> age :
		<%=request.getParameter("age")%>
		<br />
	</h2>
	
	<h3>
		页面跳转的两种方法：jsp:forward 和 response.sendRedirect(url)
		<br/>
		1.jsp:forward 跳转发生在服务器端，因此客户端显示的URL地址不会发生变化，可以使用子标签jsp:param和querystring传递参数，因为跳转前和跳转后的页面共有一个相同的request对象。
		<br/>
		2.response.sendRedirect(url) 跳转发生在客户端，因此客户端显示的URL地址会发生变化，只能使用此方法的参数url接参数来传递参数，跳转前和跳转后的页面的request对象不是用一个。
	</h3>
</body>
</html>