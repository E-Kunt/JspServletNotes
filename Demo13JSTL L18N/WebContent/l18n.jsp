<%@page import="javax.servlet.jsp.jstl.fmt.LocalizationContext"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Locale local = new Locale("zh","CN");
		ResourceBundle res = ResourceBundle.getBundle("messages",local);
	%>
	-----------------基本信息---------<br/> 
	姓名：<%=res.getString("com.ekunt.name") %><br/> 
	性别： <%=res.getString("com.ekunt.sex") %><br/> 
	年龄：<%=res.getString("com.ekunt.age") %><br/> 
	--------------------------------------<br/> 
	
	
	<br/>========================================<br/>
	<fmt:bundle basename="messages">
	-----------------基本信息---------<br/> 
	姓名：<fmt:message key="com.ekunt.name"/><br/> 
	性别：<fmt:message key="com.ekunt.sex"/> <br/> 
	年龄：<fmt:message key="com.ekunt.age"/><br/> 
	--------------------------------------<br/> 
	</fmt:bundle>
	
	
	<br/>========================================<br/>
	<fmt:setBundle basename="book"/>
	-----------------基本信息---------<br/> 
	书名：<fmt:message key="com.ekunt.name"/><br/> 
	作者：<fmt:message key="com.ekunt.author"/> <br/> 
	价格：<fmt:message key="com.ekunt.price"/><br/> 
	--------------------------------------<br/> 
	
	<fmt:bundle basename="messages">
	-----------------基本信息---------<br/> 
	姓名：<fmt:message key="com.ekunt.name"/><br/> 
	性别：<fmt:message key="com.ekunt.sex"/> <br/> 
	年龄：<fmt:message key="com.ekunt.age"/><br/> 
	--------------------------------------<br/> 
	</fmt:bundle>
	
	
	<br/>========================================<br/>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:setBundle basename="welcome"/>
	<fmt:message key="com.ekunt.forUser">
		<fmt:param value="${param.username }"/>
		<fmt:param value="${now }"/>
		<fmt:param value="${now }"/>
	</fmt:message>	
	<br/>
	
	
	
	<%--
	<br/>========================================<br/>
	<%
		ResourceBundle bun_zh = ResourceBundle.getBundle("messages",new Locale("zh","CN")); 
		ResourceBundle bun_en = ResourceBundle.getBundle("messages",new Locale("en","US")); 
		pageContext.setAttribute("zh", new LocalizationContext(bun_zh));
		pageContext.setAttribute("en", new LocalizationContext(bun_en));
	%>
	-----------------基本信息---------<br/> 
	姓名：<fmt:message bundle="zh" key="com.ekunt.name"/><br/> 
	性别：<fmt:message bundle="en" key="com.ekunt.sex"/> <br/> 
	年龄：<fmt:message bundle="en" key="com.ekunt.age"/><br/> 
	--------------------------------------<br/>
	--%>
	 
	 
	<br/>========================================<br/>
	<fmt:setLocale value="en_US"/>
	<fmt:setBundle basename="messages"/>
	-----------------BASE-INFO---------<br/> 
	name：<fmt:message key="com.ekunt.name"/><br/> 
	sex：<fmt:message  key="com.ekunt.sex"/> <br/> 
	age：<fmt:message  key="com.ekunt.age"/><br/> 
	--------------------------------------<br/>
	
	
	<br/>========================================<br/>
	<fmt:formatDate value="${now }"/> <br/>
	<fmt:formatDate value="${now }" type="date" dateStyle="full"/> <br/>
	<fmt:formatDate value="${now }" type="time" timeStyle="medium"/> <br/>
	<fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="medium"/> <br/>
	<fmt:formatDate value="${now }" pattern="yyyy年MM月dd日，HH时mm分ss秒"/> <br/>
	<fmt:timeZone value="GMT+1:00">
		<fmt:formatDate value="${now }" type="both"/>
	</fmt:timeZone>
	<br/>
	
	
	<br/>========================================<br/>
	<fmt:formatNumber value="12345.678" type="number"/><br/>
	<fmt:formatNumber value="12345.678" type="currency" currencySymbol="RMB"/><br/>
	<fmt:formatNumber value="12345.678" type="percent"/><br/>
	<fmt:formatNumber value="12345.678" pattern="#,#00.0#"/><br/>
	
	<br/>========================================<br/>
	<fmt:setLocale value="en_US"/>
	<fmt:formatDate value="${now }" type="both"/> <br/>
	<fmt:formatNumber value="12345.678" type="currency"/> <br/>
</body>
</html>