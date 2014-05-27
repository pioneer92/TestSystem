<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function showTime() {
		today = new Date();
		with (today) {
			document.all.mytime.innerText = getHours() + ":" + getMinutes()
					+ ":" + getSeconds();
		}
	}
</script>
<body onload="setInterval('showTime()',1000)">
	<table width="100%" background="image/all.png">
		<tr>
			<td align="center"><table width="100%">
					<tr>
						<td align="center" class="STYLE1">科目一</td>
					</tr>
					<tr>
						<td align="center">二级Java评测</td>
					</tr>
					<tr>
						<td align="center">
							<form action="testJava1.jsp#A1" target="EDIT" name="f1">
								<input type="submit" name="button1" id="button1" value="1.单项选择题"
									style="width: 110px" />
							</form>
						</td>
					</tr>
					<tr>
						<td align="center">
							<form action="testJava1.jsp#A2" target="EDIT" name="f2">
								<input type="submit" name="button1" id="button1" value="2.基本操作题"
									style="width: 110px" />
							</form>
						</td>
					</tr>
					<tr>
						<td align="center"><form action="testJava1.jsp#A3"
								target="EDIT" name="f3">
								<input type="submit" name="button1" id="button1" value="3.简单应用题"
									style="width: 110px" />
							</form></td>
					</tr>
					<tr>
						<td align="center"><form action="output.jsp" target="OUT">
								<input type="submit" name="button1" id="button1"
									value="4.清空输出窗口" style="width: 110px" />
							</form></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td align="center"><hr /></td>
		</tr>
		<tr>
			<td align="center"><table width="100%">
					<tr>
						<td align="center" class="STYLE1">科目二</td>
					</tr>
					<tr>
						<td align="center">二级C++评测</td>
					</tr>
					<tr>
						<td align="center"><form action="testCpp1.jsp#A1"
								target="EDIT">
								<input type="submit" name="button1" id="button1" value="1.单项选择题"
									style="width: 110px" />
							</form></td>
					</tr>
					<tr>
						<td align="center"><form action="testCpp1.jsp#A2"
								target="EDIT">
								<input type="submit" name="button1" id="button1" value="2.基本操作题"
									style="width: 110px" />
							</form></td>
					</tr>
					<tr>
						<td align="center"><form action="testCpp1.jsp" target="EDIT">
								<input type="submit" name="button1" id="button1" value="3.简单应用题"
									style="width: 110px" />
							</form></td>
					</tr>
					<tr>
						<td align="center"><form action="output.jsp" target="OUT">
								<input type="submit" name="button1" id="button1"
									value="4.清空输出窗口" style="width: 110px" />
							</form></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td align="center"><hr /></td>
		</tr>
		<tr>
			<td height="30" align="center"><a href="help.jsp" target="EDIT">系统简介</a></td>
		</tr>
		<tr>
			<td height="30" align="center"><a href="queryGrade.jsp"
				target="EDIT">成绩查询</a></td>
		</tr>
		<tr>
			<td height="30" align="center"><div align="center" id="mytime"
					onload="setInterval('showTime()',1000)"></div></td>
		</tr>
	</table>
</body>