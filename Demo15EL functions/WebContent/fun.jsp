<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
参数：${param.text } <br/>
长度：${fn:length(param.text)}<br/>

<br/>==================================<br/>
<c:choose>
	<c:when test="${fn:startsWith(param.user,'root') && param.password=='root'}">
		登陆成功！你好！${fn:replace(param.user,'root','管理员')}！
	</c:when>
	<c:otherwise>
		登陆失败！
	</c:otherwise>
</c:choose>

</body>
</html>