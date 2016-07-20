<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>

<%
	boolean isAdmin = false;
	String isAdminStr = (String) session.getAttribute("isAdmin");
	if (isAdminStr != null && isAdminStr.trim().equals("true")) {
		isAdmin = true;
	}
%>

<%!/**递归方法，取得某一帖子的所有回复子贴，并放入帖子列表中*/
	private void tree(List<Article> articles, Connection conn, int id, int grade) {
		String sql = "select * from article where pid = " + id;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				Article a = new Article();
				a.initFromRs(rs);
				a.setGrade(grade);
				articles.add(a);
				if (!a.isLeaf()) {
					tree(articles, conn, a.getId(), grade + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
		}
	}%>

<%
	List<Article> articles = new ArrayList<Article>();
	Connection conn = DB.getConn();
	tree(articles, conn, 0, 0);
	DB.close(conn);
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>首页|简易论坛</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css"
	title="Integrated Styles">
<script language="JavaScript" type="text/javascript"
	src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS"
	href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript"
	src="images/common.js"></script>
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
	<div id="jive-forumpage">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="98%"><p class="jive-breadcrumbs">论坛: 简易论坛</p>
						<p class="jive-description">本论坛言论自由 大家一起交流
							共同提高！谢绝任何形式的广告</p></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons">
			<table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="jive-icon"><a
							href="postTree.jsp"><img
								src="images/post-16x16.gif" alt="发表新主题" border="0" height="16"
								width="16"></a></td>
						<td class="jive-icon-label"><a id="jive-post-thread"
							href="postTree.jsp">发表新主题</a>
							<a
							href="postTree.jsp"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td></td>
				</tr>
			</tbody>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><div class="jive-thread-list">
							<div class="jive-table">
								<table summary="List of threads" cellpadding="0" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th class="jive-first" colspan="3">主题</th>
											<th class="jive-author"><nobr> 作者 &nbsp; </nobr></th>
											<th class="jive-view-count"><nobr> 浏览 &nbsp; </nobr></th>
											<th class="jive-msg-count" nowrap="nowrap">回复</th>
											<th class="jive-last" nowrap="nowrap">最新帖子</th>
										</tr>
									</thead>
									<tbody>
										<%
											int articleNum = 0;
											for (Iterator<Article> it = articles.iterator(); it.hasNext();) {
												Article a = it.next();
												String preStr = "";
												for (int i = 0; i < a.getGrade(); i++) {
													preStr += "------";
												}
										%>
										<tr
											class="<%=(articleNum++ % 2 == 0) ? "jive-even" : "jive-odd"%>">
											<td class="jive-first" nowrap="nowrap" width="1%"><div
													class="jive-bullet">
													<img src="images/read-16x16.gif" alt="已读" border="0"
														height="16" width="16">
													<!-- div-->
												</div></td>
											<td nowrap="nowrap" width="1%">
											<%
													if (isAdmin) {
															//当前URl 
															String url = request.getRequestURL()
																	+ (request.getQueryString() == null ? ""
																			: ("?" + request.getQueryString()));
												%> <a href="update.jsp?id=<%=a.getId()%>&from=<%=url%>">修改</a>
												<a
												href="delete.jsp?id=<%=a.getId()%>&pid=<%=a.getPid()%>&isLeaf=<%=a.isLeaf()%>&from=<%=url%>">删除</a>
												<%
													}
												%>
											</td>
											<td class="jive-thread-name" width="95%"><a
												id="jive-thread-1"
												href="articleDetailTree.jsp?id=<%=a.getId()%>"><%=preStr + a.getTitle()%></a></td>
											<td class="jive-author" nowrap="nowrap" width="1%"><span
												class=""> <a
													href="#">E-Kunt</a>
											</span></td>
											<td class="jive-view-count" width="1%">354841</td>
											<td class="jive-msg-count" width="1%">11316</td>
											<td class="jive-last" nowrap="nowrap" width="1%"><div
													class="jive-last-post">
													<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(a.getPdate())%>
													<br> by: <a
														href="#"
														title="E-Kunt" style="">E-Kunt &#187;</a>
												</div></td>
										</tr>
										<%
											}
										%>

									</tbody>
								</table>
							</div>
						</div>
						<div class="jive-legend"></div></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</body>
</html>
