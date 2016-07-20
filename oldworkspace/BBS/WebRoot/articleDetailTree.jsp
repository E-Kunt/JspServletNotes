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

	//从数据库查此id对应的帖子的所有信息，并存入Article对象中。
	Article a = null;
	String sql = "select * from article where id = " + id;
	Connection conn = DB.getConn();
	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt, sql);
	while (rs.next()) {
		a = new Article();
		a.initFromRs(rs);
	}
	DB.close(rs);
	DB.close(stmt);
	DB.close(conn);
	if(a == null) {
		out.println("您所寻找的帖子不存在。");
		return;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title><%=a.getTitle()%>|简易论坛</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="images/style.css"
	title="Integrated Styles">
<script language="JavaScript" type="text/javascript"
	src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS"
	href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
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
						<p class="jive-page-title">主题: <%=a.getTitle() %></p></td>
					<td width="1%"><div class="jive-accountbox"></div></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons">
			<table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="jive-icon"><a
							href="replyTree.jsp?id=<%=a.getId()%>&rootId=<%= a.getRootId() %>"><img
								src="images/reply-16x16.gif" alt="回复本主题" border="0" height="16"
								width="16"></a></td>
						<td class="jive-icon-label"><a id="jive-reply-thread"
							href="replyTree.jsp?id=<%=a.getId()%>&rootId=<%= a.getRootId() %>">回复本主题</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><div id="jive-message-holder">
							<div class="jive-message-list">
								<div class="jive-table">
									<div class="jive-messagebox">
										<table summary="Message" border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr id="jive-message-780144" class="jive-odd" valign="top">
													<td class="jive-first" width="1%">
														<!-- 个人信息的table -->
														<table border="0" cellpadding="0" cellspacing="0"
															width="150">
															<tbody>
																<tr>
																	<td><table border="0" cellpadding="0"
																			cellspacing="0" width="100%">
																			<tbody>
																				<tr valign="top">
																					<td style="padding: 0px;" width="1%"><nobr>
																							<a
																								href="#"
																								title="E-Kunt">E-Kunt</a>
																						</nobr></td>
																					<td style="padding: 0px;" width="99%"><img
																						class="jive-status-level-image"
																						src="images/level3.gif" title="世界新手" alt=""
																						border="0"><br></td>
																				</tr>
																			</tbody>
																		</table> <img class="jive-avatar"
																		src="images/avatar-display.png" alt="" border="0" width="100px" height="100px">
																		<br> <br> <span class="jive-description">
																			发表: 34 <br> 点数: 100<br> 注册: 16-3-19 <br>
																			<a href="http://blog.csdn.net/e_kunt"
																			target="_blank"><font color="red">访问我的Blog</font></a>
																	</span></td>
																</tr>
															</tbody>
														</table> <!--个人信息table结束-->

													</td>
													<td class="jive-last" width="99%"><table border="0"
															cellpadding="0" cellspacing="0" width="100%">
															<tbody>
																<tr valign="top">
																	<td width="1%"></td>
																	<td width="97%"><span class="jive-subject">
																			父贴</span></td>
																	<td class="jive-rating-buttons" nowrap="nowrap"
																		width="1%"></td>
																	<td width="1%"><div class="jive-buttons">
																			<table border="0" cellpadding="0" cellspacing="0">
																				<tbody>
																					<tr>
																						<td>&nbsp;</td>
																						<td class="jive-icon"><a
																							href="replyTree.jsp?id=<%=a.getId() %>&rootId=<%=a.getRootId() %>"
																							title="回复本主题"><img
																								src="images/reply-16x16.gif" alt="回复本主题"
																								border="0" height="16" width="16"></a></td>
																						<td class="jive-icon-label"><a
																							href="replyTree.jsp?id=<%=a.getId() %>&rootId=<%=a.getRootId() %>"
																							title="回复本主题">回复</a></td>
																					</tr>
																				</tbody>
																			</table>
																		</div></td>
																</tr>
																<tr>
																	<td colspan="4"
																		style="border-top: 1px solid rgb(204, 204, 204);"><br>
																		<%=a.getCont() %> <br> <br></td>
																</tr>
																<tr>
																	<td colspan="4" style="font-size: 9pt;"><img
																		src="images/sigline.gif"><br> <font
																		color="#568ac2">学程序是枯燥的事情，愿大家在一起能从中得到快乐！</font> <br>
																	</td>
																</tr>
																<tr>
																	<td colspan="4"
																		style="border-top: 1px solid rgb(204, 204, 204); font-size: 9pt; table-layout: fixed;">
																		·我的微博：<a href="http://weibo.com/devilwhite" target="_blank"><font
																			color="#666666">http://weibo.com/devilwhite</font></a>
																	</td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table>
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
