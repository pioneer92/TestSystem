package com.njupt.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.njupt.model.StudentBean;
import com.njupt.model.StudentBeanBO;

/**
 * Servlet implementation class LoginCl
 */
@WebServlet("/LoginCl")
public class LoginCl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stuid = request.getParameter("stuid");
		String password = request.getParameter("password");
		String certCode=request.getParameter("certCode");
		HttpSession httpSession=request.getSession();
		String code=(String) httpSession.getAttribute("certCode");
		if (stuid==null || stuid.equals("")) {	//�û���Ϊ�գ��������µ�¼
			request.setAttribute("info", "ѧ�Ų���Ϊ��");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else if (password==null || password.equals("")) {		//����Ϊ�գ��������µ�¼
			request.setAttribute("info", "���벻��Ϊ��");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else {			//�û�����������֤	
			if (certCode==null || certCode.equals("")) {
				request.setAttribute("info", "��֤�벻��Ϊ��");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if(!code.equals(certCode)) {
				request.setAttribute("info", "��֤�벻��ȷ");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}	
			StudentBeanBO studentBeanBO=new StudentBeanBO();
			int check=studentBeanBO.checkUser(stuid, password);
			switch (check) {
				case 0:			//�û���������
					request.setAttribute("info", "ѧ�Ŵ���");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					break;
					
				case 1:			//�������
					request.setAttribute("info", "�������");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					break;
					
				case 2:			//�û��������붼��ȷ
					String userkeep	=request.getParameter("userkeep");
					if (userkeep!=null) {
						Cookie cookie=new Cookie("stuid", stuid);
						cookie.setMaxAge(14*24*3600);
						response.addCookie(cookie);
					}
					StudentBean studentBean=studentBeanBO.getUserBean(stuid);
					httpSession.setAttribute("studentBean", studentBean);
					request.getRequestDispatcher("ide.jsp").forward(request, response);
					break;

				default:
					break;
			}
		}
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
