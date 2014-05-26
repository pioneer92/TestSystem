package com.njupt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.njupt.model.StudentBean;
import com.njupt.model.StudentBeanBO;

/**
 * Servlet implementation class ScoringSerlvet
 */
@WebServlet("/ScoringSerlvet")
public class ScoringSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoringSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		//1.���㵥ѡ��÷�
		int score=0;
		int D=5;
		String stdKeys[]={"B","C","D","B","C","D","B","D","B","D","B","A"};
		String usrKeys[]=new String[12];
		String radioNames[]=new String[12];
		for(int i=0;i<12;i++)
		{
			radioNames[i]="radio"+i;
			usrKeys[i]=request.getParameter(radioNames[i]);
			if(usrKeys[i]==null){
				out.println("���㵥ѡ��� "+(i+1)+" �ⲻ��Ϊ��!!!");
				return;
			}
			if(usrKeys[i].equals(stdKeys[i]))
				score++;
		}
		score=score*D;

		//2.�������������÷�
		String code1=request.getParameter("CODE1");
		String code2=request.getParameter("CODE2");
		String code3=request.getParameter("CODE3");
		if (code1==null) {
			out.println("�������������� 1 �ⲻ��Ϊ��!!!");
			return;
		} else {
			code1=code1.trim();
			if (code1.equals("")) {
				out.println("�������������� 1 �ⲻ��Ϊ��!!!");
				return;
			}
		}
		
		if (code2==null) {
			out.println("�������������� 2 �ⲻ��Ϊ��!!!");
			return;
		} else {
			code2=code2.trim();
			if (code2.equals("")) {
				out.println("�������������� 2 �ⲻ��Ϊ��!!!");
				return;
			}
		}
		
		if (code3==null) {
			out.println("�������������� 3 �ⲻ��Ϊ��!!!");
			return;
		} else {
			code3=code3.trim();
			if (code3.equals("")) {
				out.println("�������������� 3 �ⲻ��Ϊ��!!!");
				return;
			}
		}
		boolean isRight=false;
		if(code1.equals("sum=0"))
			score=score+6;
		//������4�ִ�
		isRight=code2.equals("pos%2==1")||code2.equals("pos%2!=0")||code2.equals("1==pos%2")||code2.equals("0!=pos%2");
		if(isRight)
			score=score+6;
		isRight=false;
		isRight=code3.equals("pos++")||code3.equals("++pos")||code3.equals("pos=pos+1");
		if(isRight)
			score=score+6;

		//3.�����Ӧ����÷�
		String code4=request.getParameter("CODE4");
		String code5=request.getParameter("CODE5");
		
		if (code4==null) {
			out.println("�����Ӧ����� 1 �ⲻ��Ϊ��!!!");
			return;
		} else {
			code4=code4.trim();
			if (code4.equals("")) {
				out.println("�������������� 1 �ⲻ��Ϊ��!!!");
				return;
			}
		}
		
		if (code5==null) {
			out.println("�������������� 2 �ⲻ��Ϊ��!!!");
			return;
		} else {
			code5=code5.trim();
			if (code5.equals("")) {
				out.println("�������������� 2 �ⲻ��Ϊ��!!!");
				return;
			}
		}
		isRight=false;
		isRight=code4.equals("implements KeyListener")||(code4.equals("implements  KeyListener"));
		if(isRight)
			score=score+11;
		isRight=false;
		isRight=code5.equals("keyPressed(KeyEvent e)")||code5.equals("keyPressed(KeyEvent  e)");
		if(isRight)
			score=score+11;
		if(score>=60)
			out.println("<h2 style=\"color:#FF0000;\">Score:"+score+",��ϲ��ͨ������!</h2>"); //��ͻ�����ʾ�÷�
		else
			out.println("<h2 style=\"color:#00FF00;\">Score:"+score+",���ź����㻹��Ҫ����Ŭ��!</h2>");
		
		
		StudentBean studentBean=(StudentBean) request.getSession().getAttribute("studentBean");
		String stuid=studentBean.getStuid();
		String courname=request.getParameter("courname");
		StudentBeanBO studentBeanBO=new StudentBeanBO();
		boolean result=studentBeanBO.insertScore(stuid, courname, score+"");
		if (result) {
			System.out.println("�ɼ�����ɹ�");
		} else {
			System.out.println("�ɼ�����ʧ��");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
