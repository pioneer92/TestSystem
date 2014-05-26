<%@page import="com.njupt.model.CoursesBeanBO"%>
<%@page import="com.njupt.model.StudentScoreBean"%>
<%@page import="com.njupt.model.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.njupt.model.StudentBeanBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	StudentBeanBO studentBeanBO=new StudentBeanBO();
	StudentBean studentBean=(StudentBean)request.getSession().getAttribute("studentBean");
	ArrayList<StudentScoreBean> arrayList=(ArrayList)studentBeanBO.getStudentScoreBeanById(studentBean.getStuid());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "黑体";
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<center>
		<p class="STYLE1"><h1>考试成绩</h1></p>

		<table width="600px" border="1">
			<tr>
				<td width="33%" align="center">考试名称</td>
				<td width="33%" align="center">时间</td>
				<td width="33%" align="center">成绩</td>
			</tr>
			<%
				for(int i=0;i<arrayList.size();i++){
					StudentScoreBean studentScoreBean=arrayList.get(i);
					CoursesBeanBO coursesBeanBO=new CoursesBeanBO();
					String coursename=coursesBeanBO.getCourseNameById(studentScoreBean.getCourseid());
					%>
						<tr>
							<td align="center"><%=studentScoreBean.getTimestamp() %></td>
							<td align="center"><%=coursename %></td>
							<td align="center"><%=studentScoreBean.getScore() %></td>
						</tr>
					<%
				}
			%>
		</table>
	</center>
</body>

</html>
