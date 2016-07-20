<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*, java.io.*, java.util.*, com.ekunt.bbs.bean.*, com.ekunt.bbs.util.*"%>
<%
	//通过参数，获得回复的相关信息
	request.setCharacterEncoding("UTF-8");
	//获得参数id,转换为int
	String pidStr = request.getParameter("pid");
	if (pidStr == null || pidStr.trim().equals("")) {
		out.println("Error: The parameter 'pid' is null or empty.");
		return;
	}
	int pid = 0;
	try {
		pid = Integer.parseInt(pidStr);
	} catch (NumberFormatException e) {
		out.println("Error: The parameter 'pid' is not a number");
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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//把回复的信息插入数据库
	boolean isSucceed = false; //操作成功标志位
	boolean isAutoCommit = false;
	String sql = "insert into article values (null, ?, ?, ?, ?, now(), ?)";
	Connection conn = DB.getConn();
	isAutoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false); 
	PreparedStatement pstmt = DB.prepareStmt(conn, sql);
	pstmt.setInt(1, pid);
	pstmt.setInt(2, rootId);
	pstmt.setString(3, title);
	pstmt.setString(4, content);
	pstmt.setInt(5, 0);
	pstmt.addBatch();
	
	//把父贴该为非叶子节点
	String sql2 = "update article set isleaf = 1 where id = " + pid;
	pstmt.addBatch(sql2);
	
	pstmt.executeBatch();
	conn.commit(); //取消自动提交，手动提交保证操作原子性
	conn.setAutoCommit(isAutoCommit);
	isSucceed = true; //操作成功
	DB.close(pstmt);
	DB.close(conn);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript1.2" type="text/javascript">
function delayURL(url) {
	var time = document.getElementById("time").innerHTML;
	if(time > 0) {
		time--;
		document.getElementById("time").innerHTML = time;
	} else {
		window.top.location.href = url;
	}
	setTimeout("delayURL('"+ url +"')",1000);
}
</script>
<title>回复结果|简易论坛</title>
</head>
<body>
<%= isSucceed?"恭喜你，回复成功！":"回复失败，请稍后再试。" %>
<span id="time">5</span>秒后自动跳转，如果不跳转，请点击链接:<a href="articleTree.jsp">帖子列表</a>
<script type="text/javascript">delayURL("articleTree.jsp");</script>

</body>
</html>