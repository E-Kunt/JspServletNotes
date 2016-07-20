<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="fake" uri="http://ekunt.com/jsp/jstl/fake" %>
<%
	List<String> list = new ArrayList<String>();
	list.add("adol");
	list.add("fenna");
	list.add("tia");
	request.setAttribute("names", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<fake:if test="${param.password == '123456' }">
	您的秘密数据在这里！
</fake:if>

<br/>

<fake:toUpperCase>
	<fake:forEach items="${names }" var="name">
		${name } <br/>
	</fake:forEach>
</fake:toUpperCase>

<br/>

<fake:choose>
	<fake:when test="${param.password == '123456' }">
		登录成功！
	</fake:when>
	<fake:when test="${param.password == 'root' }">
		登录成功！
	</fake:when>
	<fake:otherwise>
		登录失败！
	</fake:otherwise>
</fake:choose>

<br/>

</body>
</html>