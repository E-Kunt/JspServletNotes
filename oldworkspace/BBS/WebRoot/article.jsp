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

<%
	final int PAGE_SIZE = 15; //每页显示的帖子数
	int totalPages = 1; //总的页数
	int totalRecords = 0; //总的主题帖数
	int pageNo = 1; //当前页码
	Connection conn = null;
	Statement stmtCount = null;
	ResultSet rsCount = null;
	Statement stmt = null;
	ResultSet rs = null;
	List<Article> articles = new ArrayList<Article>();

	//获得参数pageNo,转换为int，作为当前页码，存入变量pageNo
	String pageNoStr = request.getParameter("pageNo");
	if (pageNoStr == null || pageNoStr.trim().equals("")) {
		pageNo = 1;
	}
	try {
		pageNo = Integer.parseInt(pageNoStr);
	} catch (NumberFormatException e) {
		pageNo = 1;
	}
	if (pageNo <= 0)
		pageNo = 1;

	try {
		//从数据库查询主题帖的总数量，存入变量totalRecords。
		conn = DB.getConn();
		stmtCount = DB.createStmt(conn);
		rsCount = DB.executeQuery(stmtCount,
				"select count(*) from article where pid = 0");
		rsCount.next();
		totalRecords = rsCount.getInt(1);

		//算出一共需要多少页，存入变量totalPages
		totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

		if (pageNo > totalPages)
			pageNo = totalPages;

		//从数据库查询该页所有的主题帖子的信息，存入列表articles;
		int startPos = (pageNo - 1) * PAGE_SIZE;
		String sql = "select * from article where pid = 0 order by pdate desc limit "
				+ startPos + "," + PAGE_SIZE;
		stmt = DB.createStmt(conn);
		rs = DB.executeQuery(stmt, sql);

		while (rs.next()) {
			Article a = new Article();
			a.initFromRs(rs);
			articles.add(a);
		}
	} finally {
		DB.close(rsCount);
		DB.close(stmtCount);
		DB.close(rs);
		DB.close(stmt);
		DB.close(conn);
	}
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
						<p class="jive-description">本论坛言论自由  大家一起交流
							共同提高！谢绝任何形式的广告</p></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons">
			<table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="jive-icon"><a href="post.jsp"><img
								src="images/post-16x16.gif" alt="发表新主题" border="0" height="16"
								width="16"></a></td>
						<td class="jive-icon-label"><a id="jive-post-thread"
							href="post.jsp">发表新主题</a> <a href="post.jsp"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td><span class="nobreak"> 第<%=pageNo%>页，共<%=totalPages%>页
							- <span class="jive-paginator"> [ <a
								href="article.jsp?pageNo=1">第一页</a> | <a
								href="article.jsp?pageNo=<%=pageNo == 1 ? 1 : pageNo - 1%>">上一页</a>
								| <a
								href="article.jsp?pageNo=<%=pageNo == totalPages ? pageNo : pageNo + 1%>">下一页</a>
								| <a href="article.jsp?pageNo=<%=totalPages%>">最后一页</a> ]
						</span>
					</span></td>
					<td align="right"><form action="searchResult.jsp" method="get">
							<input type="text" name="keyword" />
							 <input type="submit" value="搜索" />
						</form>
					</td>
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
												href="articleDetail.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a></td>
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
