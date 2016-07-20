<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>

<%
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

	//获得参数rootId,转换为int
	String rootIdStr = request.getParameter("rootId");
	if (rootIdStr == null || rootIdStr.trim().equals("")) {
		out.println("Error: The parameter 'rootId' is null or empty.");
		return;
	}
	int rootId = 0;
	try {
		rootId = Integer.parseInt(rootIdStr);
	} catch (NumberFormatException e) {
		out.println("Error: The parameter 'rootId' is not a number");
		return;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>回复贴子|简易论坛</title>
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
							<a href="articleTree.jsp">首页</a> &#187;
							
						</p>
						<p class="jive-page-title">
							回复主题:
							<%--=a.getTitle()--%>
						</p></td>
					<td width="1%"><div class="jive-accountbox"></div></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons">
			
		</div>
		<br>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><div id="jive-message-holder">
							<div class="jive-message-list">
								<div class="jive-table">
									<div class="jive-messagebox">
										<form action="replyDealTree.jsp" method="post">
											<input type="hidden" name="pid" value="<%=id%>"> <input
												type="hidden" name="rootId" value="<%=rootId%>"> 标题：<input
												type="text" name="title" /> <br /> 内容：
											<textarea rows="15" cols="80" name="content"></textarea>
											<script type="text/javascript">CKEDITOR.replace("content");</script>
											<br />
											<br /> <input type="submit" value="确认回复">
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
																href="articleTree.jsp"><img
																	src="images/arrow-left-16x16.gif" alt="返回到主题列表"
																	border="0" height="16" hspace="6" width="16"></a></td>
															<td><a
																href="articleTree.jsp">返回到主题列表</a>
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
