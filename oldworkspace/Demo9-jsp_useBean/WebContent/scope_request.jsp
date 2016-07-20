<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="cb" class="bean.Count" scope="request"></jsp:useBean>
<jsp:setProperty name="cb" property="count" value="100"/>

<%--
	//上面两句相当于以下代码 (Session,Application的情况类似)
	bean.Count cb = (bean.Count)request.getAttribute("cb");
	if(cb == null) {
		cb = new bean.Count();
		request.setAttribute("cb", cb);
	}
	
	cb.setCount(100);
--%>

<jsp:forward page="scope_request2.jsp"></jsp:forward> 


</body>
</html>