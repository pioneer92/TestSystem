<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String info = (String) request.getAttribute("info");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Test</title>
<script type="text/javascript">
	function changeimg() {
		var myimg = document.getElementById("code");
		now = new Date();
		myimg.src = "makeCertPic.jsp?code=" + now.getTime();
	}
</script>
<link href="css/my.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="70%" border="0" align="center">
		<tr>
			<td align="center"><jsp:include page="title.jsp" flush="true"></jsp:include></td>
		</tr>
		<tr>
			<td height="357" align="center">
				<%
					if (info != null) {
						out.println("<h1>" + info + "</h1>");
					}
				%>
				<form action="/TestSystem/LoginCl" method="post">
					<table width="30%" border="1" align="right">
						<tr height="40px">
							<td width="30%" align="right" bgcolor="#009999"><span
								class="STYLE2">学&nbsp;&nbsp;&nbsp;&nbsp;号：</span></td>
							<td width="70%" align="left" bgcolor="#009999"><input
								placeholder="请输入学号" type="text" name="stuid" id="textfield"
								class="STYLE3" /></td>
						</tr>
						<tr height="40px">
							<td align="right" bgcolor="#009999"><span class="STYLE2">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span></td>
							<td align="left" bgcolor="#009999"><input
								placeholder="请输入密码" type="password" name="password"
								id="textfield2" class="STYLE3" /></td>
						</tr>
						<tr height="40px">
							<td align="right" bgcolor="#009999"><span class="STYLE2">验证码：</span></td>
							<td align="left" bgcolor="#009999"><input type="text"
								name="certCode" placeholder="请输入验证码" class="STYLE14" /> <a
								href="javascript:changeimg()"><img align="bottom" id="code"
									src="makeCertPic.jsp" alt="" /></a></td>
						</tr>
						<tr height="40px">
							<td align="center" bgcolor="#009999" colspan="2">
								<input type="radio" name="radio0" id="radio" checked="checked" value="student" />学生
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="radio0" id="radio" value="admin" />管理员
							</td>
						</tr>
						<tr height="40px">
							<td align="center" bgcolor="#009999" colspan="2"><span
								class="STYLE2"> <input type="submit" name="button"
									id="button" value="登陆" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="button2" id="button2" value="清空" />
							</span></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td align="center"><p class="STYLE5">设计人员：韦修远</p>
				<p class="STYLE5">版权声明：南京邮电大学</p></td>
		</tr>
	</table>
</body>
</html>