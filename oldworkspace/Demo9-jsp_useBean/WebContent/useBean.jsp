<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%//使用javaBean的两种方式 %>

<%//方式一 %>
<jsp:useBean id="cb" class="bean.Count" scope="page"></jsp:useBean>
<jsp:setProperty name="cb" property="count" value="30"/>
<jsp:getProperty name="cb" property="count"/>

<br/>

<%//方式二 %>
<%
	bean.Count cb2 = new bean.Count();
	cb2.setCount(30);
	out.println(cb2.getCount());
%>


</body>
</html>