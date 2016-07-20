<%
	String isAdminStr = (String) session.getAttribute("isAdmin");
	if(isAdminStr == null || !isAdminStr.trim().equals("true")) {
		response.sendRedirect("login.jsp");
		return;
	}
 %>