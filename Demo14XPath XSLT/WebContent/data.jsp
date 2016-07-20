<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import var="xml" url="data.xml" charEncoding="UTF-8" />
	<x:parse var="data" doc="${xml }" scope="session" />
	<h2>主要数据</h2>
	<table border="1">
		<tr bgcolor="#00ff00">
			<th align="left">编号</th>
			<th align="left">姓名</th>
			<th align="left">年龄</th>
		</tr>
		<x:forEach var="app" select="$sessionScope:data/apps/app">
		<tr>
			<td><x:out select="$app/id"/></td>
			<td><x:out select="$app/name"/></td>
			<td><x:out select="$app/age"/></td>
		</tr>
		</x:forEach>

	</table>
</body>
</html>