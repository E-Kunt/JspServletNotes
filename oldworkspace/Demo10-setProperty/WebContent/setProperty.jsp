<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎界面</title>
</head>
<body>
	<%
		//使用request对象之前，想把里面的东西转换成UTF-8的编码
		request.setCharacterEncoding("utf-8");	
	%>
	
	<%-- 【以下演示property="*" 的使用】 --%>
	<jsp:useBean id="person" class="bean.Person"></jsp:useBean>
	<%-- 根据参数自动赋值所有属性 --%>
	<jsp:setProperty name="person" property="*" />
	<b>你好！<jsp:getProperty name="person" property="name" /> <jsp:getProperty
			name="person" property="sex" />！
	</b>
	<br/>
	
	<%-- 【以下演示param="xxx"的使用】 --%>
	<jsp:useBean id="person2" class="bean.Person"></jsp:useBean>
	<%-- 以下两句功能相同 --%>
	<jsp:setProperty name="person2" property="name" param="name" />
	<jsp:setProperty name="person2" property="sex" value='<%=request.getParameter("sex") %>'/>
	<b>你好！<jsp:getProperty name="person2" property="name" /> <jsp:getProperty
			name="person2" property="sex" />！
	</b>


</body>
</html>