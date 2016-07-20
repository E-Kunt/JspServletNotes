<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>
<%@include file="_sessionCheck.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//获得参数id,转换为int
	String idStr = request.getParameter("id");
	if (idStr == null || idStr.trim().equals("")) {
		out.println("Error: The parameter 'id' is null or empty.");
		return;
	}
	int id = 0;
	try {
		id = Integer.parseInt(idStr);
	} catch (NumberFormatException e) {
		out.println("Error: The parameter 'id' is not a number");
		return;
	}
	
	//获得参数from，用于删除后跳转回原页面
	String url = request.getParameter("from");
	if(url == null || url.trim().equals("")) {
		url = "article.jsp";
	}
	
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("update")) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Connection conn = DB.getConn();
		PreparedStatement pstmt = DB.prepareStmt(conn, "update article set title = ?, cont = ? where id = ?");
		pstmt.setString(1, title);
		pstmt.setString(2,content);
		pstmt.setInt(3, id);
		pstmt.executeUpdate();
		DB.close(pstmt);
		DB.close(conn);
		out.println("<script type='text/javascript'>alert('修改成功！'); window.top.location.href='"+ url +"';</script>");
		return;
	}
%>


<%
	//给页面文本框赋值，显示帖子原来的内容
	Connection conn = DB.getConn();
	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt, "select * from article where id = " + id);
	rs.next();
	Article a = new Article();
	a.initFromRs(rs);
	DB.close(rs);
	DB.close(stmt);
	DB.close(conn);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改帖子|简易论坛</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="images/style.css"
	title="Integrated Styles">
<script language="JavaScript" type="text/javascript"
	src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS"
	href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

</head>
<body>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tbody>
			<tr>
				
				<td><img src="images/header-stretch.gif" alt="" border="0"
					height="57" width="100%"></td>
				<td width="1%"><img src="images/header-right.gif" alt=""
					border="0"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<div id="jive-flatpage">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><p class="jive-breadcrumbs">
							<a href="<%=url%>">首页</a> &#187;
							
						</p>
						<p class="jive-page-title">修改帖子:</p></td>
					<td width="1%"><div class="jive-accountbox"></div></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons"></div>
		<br>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><div id="jive-message-holder">
							<div class="jive-message-list">
								<div class="jive-table">
									<div class="jive-messagebox">
										<form action="update.jsp" method="post">
											
											<input type="hidden" name="action" value="update" />
											<input type="hidden" name="id" value="<%=id%>" />
											<input type="hidden" name="from" value="<%=url%>" />
											 标题：<input
												type="text" name="title"  value="<%=a.getTitle()%>"/> <br /> 内容：
											<textarea rows="15" cols="80" name="content"><%=a.getCont()%></textarea>
											<script type="text/javascript">
												CKEDITOR.replace("content");
											</script>
											<br /> <br /> <input type="submit" value="确认发表">
										</form>
									</div>
								</div>
							</div>
							<div class="jive-message-list-footer">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<td nowrap="nowrap" width="1%"></td>
											<td align="center" width="98%"><table border="0"
													cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td><a
																href="<%=url%>"><img
																	src="images/arrow-left-16x16.gif" alt="返回到主题列表"
																	border="0" height="16" hspace="6" width="16"></a></td>
															<td><a
																href="<%=url%>">返回到主题列表</a>
															</td>
														</tr>
													</tbody>
												</table></td>
											<td nowrap="nowrap" width="1%">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div></td>
					<td width="1%"></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
