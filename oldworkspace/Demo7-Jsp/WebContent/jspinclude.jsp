<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<br/>
这是jspinclude.jsp文件里的文字，是home.jsp文件通过jsp:include和jsp:param命令，在运行时期间引进来的，可以带参数。
<br/>
参数param = <%= request.getParameter("param") %> 
