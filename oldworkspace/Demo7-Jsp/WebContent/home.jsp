<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- jsp注释风格1 --%>
<%
	// jsp注释风格2
%>
<%
	/* jsp注释风格3 */
%>

<%!int accessTimes = 0; //定义的是类的成员变量%>
<%
	String title = "通过指定参数color的值，改变页面颜色"; //定义的是在_jspService()方法里的局部变量
%>

<%
	//获得URL参数color的值
	String color = request.getParameter("color");
	boolean isColorSelected = false;
	if (color == null) {
		color = "white";
		isColorSelected = false;
	} else {
		isColorSelected = true;
	}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=title%></title>
</head>
<body bgColor="<%=color%>">
	<%
		if (isColorSelected == false) {
			out.println("当前页面颜色为白色，可以通过URL参数color改变页面颜色");
		} else {
			out.println("当前页面颜色为: " + color);
		}
	%>
	<br /> 访问次数:<%=++accessTimes%>
	<br /> 客户端:<%=request.getRemoteHost()%>
	<br /> Session ID:<%=session.getId()%>
	<br /> 当前时间:<%=new Date()%>
	<br />
	<%@include file="include.jsp"%>
	<br />
	<jsp:include page="jspinclude.jsp" flush="true">
		<jsp:param name="param" value="E-Kunt" />
	</jsp:include>


</body>
</html>