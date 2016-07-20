<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap,java.util.Map,java.util.ArrayList,java.util.List"%>
<jsp:useBean id="bean" class="com.bean.User">
</jsp:useBean>
<jsp:setProperty name="bean" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	用户：<jsp:getProperty property="name" name="bean"/>
	<br/>
	密码：${bean.password}
	
	
	<br/>--------------------------------------------------<br/>
	<%
		Map<String,String> map = new HashMap<String,String>();
		map.put("user","caterpillar");
		map.put("local.role", "admin");
		request.setAttribute("login", map);
	%>
	${login.user } 
	${login["local.role"] } 
	
	
	<br/>--------------------------------------------------<br/>
	<%
		List<String> names = new ArrayList<String>();
		names.add("caterpillar");
		names.add("ekunt");
		names.add("jack");
		names.add("tom");
		request.setAttribute("names", names);
	%>
	${names[0] }  
	${names["0"] }  
	
	
	
	<br/>--------------------------------------------------<br/>
	<c:if test="${bean.name=='root' && bean.password=='root'}">
		<b>用户和密码正确</b>
	</c:if>
	
	
	
	<br/>--------------------------------------------------<br/>
	<c:choose>
		<c:when test="${bean.name=='root' && bean.password=='root'}">
			<b>用户和密码正确</b>
		</c:when>
		<c:when test="${bean.name=='admin' && bean.password=='admin'}">
			<b>用户和密码正确</b>
		</c:when>
		<c:otherwise>
			<b>用户和密码错误</b>
		</c:otherwise>
	</c:choose>
	
	
	<br/>--------------------------------------------------<br/>
	<c:forEach var="name" items="${names }">
		<b>${name}</b>
		<br/>
	</c:forEach>
	
	
	<br/>--------------------------------------------------<br/>
	<c:forEach var="entry" items="${login }">
		<b>key: ${entry.key }</b> |
		<b>value: ${entry.value }</b>
		<br/>
	</c:forEach>
	
	
	<br/>--------------------------------------------------<br/>
	<c:forEach var="city" items="北京,上海,广州,深圳,香港">
		<b>${city}</b>
		<br/>
	</c:forEach>



	<br/>--------------------------------------------------<br/>
	<c:forTokens var="city" delims="和" items="北京和上海和广州和深圳和香港">
		<b>${city}</b>
		<br/>
	</c:forTokens>

	
	<br/>--------------------------------------------------<br/>
	<c:catch var="error">
		${param.a} + ${param.b } = ${param.a + param.b} 
	</c:catch>
	<c:if test="${error != null }">
		<br>
		<b>${error.message }</b>
		<br/>
		<b>${error}</b>
	</c:if>
	
	
	<br/>--------------------------------------------------<br/>
	<c:import url="add.jsp">
		<c:param name="a" value="1"/>
		<c:param name="b" value="2"/>
	</c:import>
	
	<%--
	<br/>--------------------------------------------------<br/>
	<c:import url="http://www.baidu.com" charEncoding="BIG5"/> 
	--%>
	
	
	<%--
	<br/>--------------------------------------------------<br/>
	<c:redirect url="add.jsp">
		<c:param name="a" value="1"/>
		<c:param name="b" value="2"/>
	</c:redirect>
	--%>
	
	<br/>--------------------------------------------------<br/>
	<c:set var="login" value="${bean }" scope="session"/>
	${sessionScope.login.name}----${sessionScope.login.password}
	<br/>
	
	<c:set var="detail" scope="session">
		catepillar,ekunt,guangdong,beijing
	</c:set>
	${detail }
	<br/>
	
	<c:set target="${pageContext.request }" property="characterEncoding" value="UTF-8"/>
	${pageContext.request.characterEncoding }
	<br/>
	
	<c:set target="${bean }" property="name" value="${param.name}"/>
	${bean.name }
	<br/>
	
	<c:set target="${login }" property="thekey" value="value"/>
	${login.thekey } 
	<br/>
	
	<c:out value="<a href='www.baidu.com'>baidu</a>"/>
	<br/>
	
	<c:out value="${param.a }" default="a"/>
	<br/>
	
</body>
</html>