<%@page import="com.njupt.model.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HttpSession httpSession=request.getSession();
	StudentBean studentBean=(StudentBean)httpSession.getAttribute("studentBean");
	if(studentBean==null){
		response.sendRedirect("index.jsp");
	}
	String courname="二级Java评测";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Java</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "黑体";
	font-weight: bold;
	font-size: 22px;
}

.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}

body {
	background-color: #FFFFFF;
}
-->
</style>
</head>

<body>
	<p align="left" class="STYLE1">&nbsp;</p>
	<form action="/TestSystem1/ScoringSerlvet" method="post" target="OUT">
	<input type="hidden" name="courname" value="<%=courname %>" />
		<table width="806" border="0">
			<tr>
				<td><a name="A1" id="A1"></a></td>
				<td colspan="2"><span class="STYLE1">2014年全国计算机等级考试(<%=courname %>)：模拟在线考试系统</span></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td width="42">&nbsp;</td>
				<td colspan="2">姓名： <label> <input type="text" readonly="readonly" value="<%=studentBean.getStuname() %>"
						name="STU_NAME" style="width: 180px; background-color: #00FFFF" />
						学号： <input type="text" name="STU_ID" value="<%=studentBean.getStuid() %>" readonly="readonly"
						style="width: 180px; background-color: #00FFFF" />
				</label></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="#CCCCCC"><div align="right"></div> <strong>一、单项选择题：（每题5分，共60分）</strong></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td><div align="right"></div></td>
				<td width="697">1.下面for循环语句的执行结果是（ ）。</td>
				<td width="53">&nbsp;</td>
			</tr>
			<tr>
				<td height="201">&nbsp;</td>
				<td><img src="image/1.png" width="293" height="171" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> A. 6 &nbsp; 3<input type="radio"
						name="radio0" id="radio" value="A" />&nbsp; B. 7 &nbsp; 4<input
						type="radio" name="radio0" id="radio" value="B" />&nbsp; C. 6
						&nbsp; 2<input type="radio" name="radio0" id="radio" value="C" />&nbsp;
						D. 7 &nbsp; 3<input type="radio" name="radio0" id="radio"
						value="D" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td><div align="right"></div></td>
				<td>2.向Applet传递参数的正确描述是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> A. &lt;applet code="className"&gt;<input
						type="radio" name="radio1" value="A" />&nbsp; B. &lt;value&gt;<input
						type="radio" name="radio1" value="B" /><br /> C. &lt;param
						name="argName" value="argValue"&gt;<input type="radio"
						name="radio1" value="C" />&nbsp; D. &lt;name="" value=""&gt;<input
						type="radio" name="radio1" value="D" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>3.以下叙述中不属于Java语言特点的是（ ）。</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><label> A. 面向对象<input type="radio" name="radio2"
						id="radio" value="A" />&nbsp; B. 可移植性<input type="radio"
						name="radio2" id="radio" value="B" />&nbsp; C. 多线程<input
						type="radio" name="radio2" id="radio" value="C" />&nbsp; D. 宏定义<input
						type="radio" name="radio2" id="radio" value="D" /></label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>4.下列选项默认的布局管理器不是BorderLayout的是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> A. Window<input type="radio" name="radio3"
						id="radio" value="A" />&nbsp; B. Panel<input type="radio"
						name="radio3" id="radio" value="B" />&nbsp; C. Frame<input
						type="radio" name="radio3" id="radio" value="C" />&nbsp; D.
						Dialog<input type="radio" name="radio3" id="radio" value="D" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>5.SQL语言又称为（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> A. 结构化定义语言<input type="radio" name="radio4"
						id="radio" value="A" />&nbsp; B. 结构化控制语言<input type="radio"
						name="radio4" id="radio" value="B" /><br /> C. 结构化查询语言<input
						type="radio" name="radio4" id="radio" value="C" />&nbsp; D.
						结构化操纵语言<input type="radio" name="radio4" id="radio" value="D" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>6.int型public成员变量MAX_LENGTH，该值保持为常数100，则定义这个变量的语句是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>A. public int MAX_LENGTH＝100;<input type="radio"
					name="radio5" id="radio" value="A" /><br /> B. final int
					MAX_LENGTH＝100;<input type="radio" name="radio5" id="radio"
					value="B" /><br /> C. public const int MAX_LENGTH＝100;<input
					type="radio" name="radio5" id="radio" value="C" /><br /> D.
					public final int MAX_LENGTH＝100;<input type="radio" name="radio5"
					id="radio" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>7.按照Java的标识符命名规则，下列表示－个类的标识符正确的是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>A. Helloworld<input type="radio" name="radio6" value="A" />&nbsp;
					B. HelloWorld<input type="radio" name="radio6" value="B" />&nbsp;
					C. helloworld<input type="radio" name="radio6" value="C" />&nbsp;
					D. helloWorld<input type="radio" name="radio6" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>8.－棵二叉树的中序遍历结果为DBEAFC，前序遍历结果为ABDECF．则后序历结果为（ ）。</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>A. ACFBED<input type="radio" name="radio7" value="A" />&nbsp;
					B. DFBECA<input type="radio" name="radio7" value="B" />&nbsp; C.
					ABCDEF<input type="radio" name="radio7" value="C" />&nbsp; D.
					DEBFCA<input type="radio" name="radio7" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>9.实现下列（ ）接口可以对TextField对象的事件注行监听和处理。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> A. ActionListener<input type="radio"
						name="radio8" value="A" />&nbsp; B. FocusListener<input
						type="radio" name="radio8" value="B" />&nbsp; C.
						MouseMotionListener<input type="radio" name="radio8" value="C" />&nbsp;
						D. WindowListener<input type="radio" name="radio8" value="D" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>10.下面排序算法中，平均排序速度最快的是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>A. 冒泡排序法<input type="radio" name="radio9" value="A" />&nbsp;
					B. 选择排序法<input type="radio" name="radio9" value="B" />&nbsp; C.
					交换排序法<input type="radio" name="radio9" value="C" />&nbsp; D. 堆排序法<input
					type="radio" name="radio9" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>11.用于在子类中调用被重写父类方法的关键字是（ ）。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>A. this<input type="radio" name="radio10" value="A" />&nbsp;
					B. super<input type="radio" name="radio10" value="B" />&nbsp; C.
					This<input type="radio" name="radio10" value="C" />&nbsp; D. Super<input
					type="radio" name="radio10" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>12.如果进栈序列为el、e2、e3、e4、e5，则可能的出栈序列是（ ）。</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>A. e3、e2、e4、e1、e5<input type="radio" name="radio11"
					value="A" />&nbsp; B. e5、e2、e4、e3、e1<input type="radio"
					name="radio11" value="B" />&nbsp; C. e3、e4、e1、e2、e5<input
					type="radio" name="radio11" value="C" />&nbsp; D. 任意顺序<input
					type="radio" name="radio11" value="D" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="#CCCCCC"><a name="A2" id="A2"></a><strong>二、基本操作题（共18分）</strong></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>13.本题中定义了一个长度为20的整数数组，然后将1～20分别赋给数组元素，计算该数组中所有下标为奇数的元素的和。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><img src="image/41.png" width="565" height="365" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><span class="STYLE2">补齐代码：</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>空栏一： <label> <input type="text" name="CODE1" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>空栏二： <label> <input type="text" name="CODE2" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>空栏三： <label> <input type="text" name="CODE3" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="#CCCCCC"><a name="A3" id="A3"></a>三、<strong>简单应用题（共22分）</strong></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>14.本题是－个Applet，页面中有10个按钮，名称从“0～9”，用鼠标任意单击其中－个按钮后，通过键盘上的上下左右键可以控制按钮在窗口中移动。</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><p>
						<img src="image/8_1.png" width="596" height="307" />
					</p>
					<p>
						<img src="image/8_2.png" width="593" height="623" />
					</p></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><span class="STYLE2">补齐代码：</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>空栏一： <label> <input type="text" name="CODE4"
						style="width: 380px;" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>空栏二： <label> <input type="text" name="CODE5"
						style="width: 380px;" />
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label>
						<div align="center">
							<input type="submit" name="button" id="button" value="提交"
								style="width: 80px; background-color: #00CC00" />&nbsp; <input
								type="reset" name="button2" id="button2" value="重置"
								style="width: 80px; background-color: #00CC00" />
						</div>
				</label></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<p>&nbsp;</p>
</body>
</html>
