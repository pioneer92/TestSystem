<%@page import="com.njupt.model.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HttpSession httpSession = request.getSession();
	StudentBean studentBean = (StudentBean) httpSession .getAttribute("studentBean");
	if (studentBean == null) {
		response.sendRedirect("index.jsp");
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Test</title>
</head>
<frameset rows="20%,*" cols="*" framespacing="0" frameborder="no"
	border="0" bordercolor="#FFFFFF"
	onload="setInterval('showTime()',1000)">
	<frame src="title.jsp" name="TOP" scrolling="no" noresize="noresize"
		id="topFrame" title="topFrame" />
	<frameset rows="*" cols="13%,*" framespacing="0" frameborder="no"
		border="0" bordercolor="#00FFFF">
		<frame src="left.jsp" name="LIST" scrolling="no" noresize="noresize"
			id="leftFrame" title="leftFrame" />
		<frameset rows="*,80" frameborder="yes" border="0" framespacing="0">
			<frame src="edit.jsp" name="EDIT" id="mainFrame" title="mainFrame" />
			<frame src="output.jsp" name="OUT" scrolling="no" noresize="noresize"
				id="bottomFrame" title="bottomFrame" />
		</frameset>
	</frameset>
</frameset>
</html>
