<%@ tag language="java" pageEncoding="UTF-8"
 	description="tagfile文件一定要放在/WEB-INF/tags目录或其子目录中"%>
<%@ attribute name="att" %>
<ul>
  <li> Hi ${att} ! </li>
  <li> <jsp:doBody/> </li>
  <li> this is the content of showMsg tag file ! </li>
</ul>

 