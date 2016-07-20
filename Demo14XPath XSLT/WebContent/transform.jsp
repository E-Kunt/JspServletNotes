<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>



<c:import var="xml" url="data.xml" charEncoding="UTF-8" />
<c:import var="xslt" url="data.xsl" charEncoding="UTF-8" />

<x:transform doc="${xml }" xslt="${xslt }">
	<%-- <x:param name="a" value="a"/> --%>
</x:transform>
