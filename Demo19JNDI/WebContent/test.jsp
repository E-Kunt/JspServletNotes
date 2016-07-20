<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="db" class="com.ekunt.DatabaseBean"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试数据库连接</title>
</head>
<body>
	<c:choose>
		<c:when test="${db.connectedOK }">
			连接成功！
		</c:when>
		<c:otherwise>
			连接失败！
		</c:otherwise>
	</c:choose>
</body>
</html>