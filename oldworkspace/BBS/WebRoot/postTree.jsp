<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("post")) {
		int pid = 0; //新主题无父贴
		int rootId = -1; //根ID是未知的自身ID，暂时设为-1
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//把新主题的信息插入数据库
		boolean isAutoCommit = false;
		String sql = "insert into article values (null, ?, ?, ?, ?, now(), ?)";
		Connection conn = DB.getConn();
		isAutoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		PreparedStatement pstmt = DB.prepareStmt(conn, sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, pid);
		pstmt.setInt(2, rootId);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		pstmt.setInt(5, 0);
		pstmt.executeUpdate();
		
		//插入后获得自动生成的Id值
		ResultSet rsKey = pstmt.getGeneratedKeys();
		rsKey.next();
		rootId = rsKey.getInt(1);
		
		//更正rootId的值
		String sqlUpdate = "update article set rootId = " + rootId + " where id = " + rootId;
		Statement stmt = DB.createStmt(conn);
		stmt.executeUpdate(sqlUpdate);
		
		conn.commit(); //取消自动提交，手动提交保证操作原子性
		conn.setAutoCommit(isAutoCommit);
		DB.close(rsKey);
		DB.close(pstmt);
		DB.close(stmt);
		DB.close(conn);
		out.println("<script type='text/javascript'>alert('发表成功！'); window.top.location.href='articleTree.jsp';</script>");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>发表新主题|简易论坛</title>
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
						<p class="jive-page-title">发布新主题:</p></td>
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
										<form action="postTree.jsp" method="post">
											<input type="hidden" name="action" value="post" /> 标题：<input
												type="text" name="title" /> <br /> 内容：
											<textarea rows="15" cols="80" name="content"></textarea>
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
