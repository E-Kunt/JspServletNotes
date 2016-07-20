<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
			</head>
			<body>
				<h2>主要数据</h2>
				<table border="1">
					<tr bgcolor="#00ff00">
						<th align="left">编号</th>
						<th align="left">姓名</th>
						<th align="left">年龄</th>
					</tr>
					<xsl:for-each select="apps/app">
					<tr>
						<td><xsl:value-of select="id"/></td>
						<td><xsl:value-of select="name"/></td>
						<td><xsl:value-of select="age"/></td>
					</tr>
					</xsl:for-each>
					
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>