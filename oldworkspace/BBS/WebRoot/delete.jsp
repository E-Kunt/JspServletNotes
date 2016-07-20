<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>
<%@include file="_sessionCheck.jsp"%>
 
<%!/**递归方法，删除某个帖子及其所有回复子贴*/
	private void delete(Connection conn, int id, boolean isLeaf) {
		Statement stmt = null;
		ResultSet rs = null;
		Statement stmtDelete = null;
		try {
			//先调用自己，删除该帖的所有子贴
			if (!isLeaf) {
				String sql = "select * from article where pid = " + id;
				stmt = DB.createStmt(conn);
				rs = DB.executeQuery(stmt, sql);
				while (rs.next()) {
					delete(conn, rs.getInt("id"), rs.getInt("isleaf") == 0); //0代表是叶子节点
				}
			}
			//再删除该帖本身
			stmtDelete = DB.createStmt(conn);
			DB.executeUpdate(stmtDelete, "delete from article where id = " + id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(stmtDelete);
		}

	}%>

<%
	//获得参数from，用于删除后跳转回原页面
	String url = request.getParameter("from");
	if(url == null || url.trim().equals("")) {
		url = "article.jsp";
	}


	//获得参数id,转换为int
	int id = 0;
	String idStr = request.getParameter("id");
	if (idStr == null || idStr.trim().equals("")) {
		out.println("Error: The parameter 'id' is null or empty.");
		return;
	}
	try {
		id = Integer.parseInt(idStr);
	} catch (NumberFormatException e) {
		out.println("Error: The parameter 'id' is not a number");
		return;
	}

	//获得参数pid,转换为int
	int pid = 0;
	String pidStr = request.getParameter("pid");
	if (pidStr == null || pidStr.trim().equals("")) {
		out.println("Error: The parameter 'pid' is null or empty.");
		return;
	}
	try {
		pid = Integer.parseInt(pidStr);
	} catch (NumberFormatException e) {
		out.println("Error: The parameter 'pid' is not a number");
		return;
	}

	//获得参数isLeaf,转换为boolean
	boolean isLeaf = true;
	String isLeafStr = request.getParameter("isLeaf");
	if (isLeafStr == null || isLeafStr.trim().equals("")) {
		out.println("Error: The parameter 'isLeaf' is null or empty.");
		return;
	}
	try {
		isLeaf = Boolean.parseBoolean(pidStr);
	} catch (Exception e) {
		out.println("Error: The parameter 'isLeaf' is not a boolean");
		return;
	}

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Statement stmtUpdate = null;
	boolean isAutoCommit = true;
	try {
		conn = DB.getConn();
		isAutoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		//先删此贴及其所有回复子贴
		delete(conn, id, isLeaf);
		//查看此贴的父贴是否还有其他子贴，若没有，则把父贴改为叶子节点
		stmt = DB.createStmt(conn);
		rs = DB.executeQuery(stmt,
				"select count(*) from article where pid = " + pid);
		rs.next();
		int count = rs.getInt(1);
		if (count <= 0) {
			stmtUpdate = DB.createStmt(conn);
			DB.executeUpdate(stmtUpdate,
					"update article set isleaf = 0 where id = " + pid);
		}
		conn.commit();
	} catch (SQLException e) {
		conn.rollback();
		e.printStackTrace();
	} finally {
		conn.setAutoCommit(isAutoCommit);
		DB.close(rs);
		DB.close(stmt);
		DB.close(stmtUpdate);
		DB.close(conn);
	}
%>

<script type="text/javascript">alert("恭喜，删除成功！"); window.top.location.href="<%=url%>"</script>
