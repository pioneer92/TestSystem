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
		if (stuid==null || stuid.equals("")) {	//用户名为空，返回重新登录
			request.setAttribute("info", "学号不能为空");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else if (password==null || password.equals("")) {		//密码为空，返回重新登录
			request.setAttribute("info", "密码不能为空");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else {			//用户名和密码验证	
			if (certCode==null || certCode.equals("")) {
				request.setAttribute("info", "验证码不能为空");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if(!code.equals(certCode)) {
				request.setAttribute("info", "验证码不正确");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}	
			StudentBeanBO studentBeanBO=new StudentBeanBO();
			int check=studentBeanBO.checkUser(stuid, password);
			switch (check) {
				case 0:			//用户名不存在
					request.setAttribute("info", "学号错误");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					break;
					
				case 1:			//密码错误
					request.setAttribute("info", "密码错误");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					break;
					
				case 2:			//用户名和密码都正确
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
