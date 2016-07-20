<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>这是原页面forward.jsp</h1>
	<jsp:forward page="taget.jsp">
		<jsp:param name="name" value="ekunt" />
		<jsp:param name="oldname" value='<%= request.getParameter("user") %>'/>
		<jsp:param name="role" value="manager"/>
	</jsp:forward>
</body>
</html>