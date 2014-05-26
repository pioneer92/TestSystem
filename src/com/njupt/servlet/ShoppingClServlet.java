package com.njupt.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.njupt.model.GoodsBean;
import com.njupt.model.MyCartBO;

/**
 * Servlet implementation class ShoppingClServlet
 */
@WebServlet("/ShoppingClServlet")
public class ShoppingClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingClServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MyCartBO myCartBO=(MyCartBO) request.getSession().getAttribute("myCartBO");
		if(myCartBO==null){
			myCartBO=new MyCartBO();
			request.getSession().setAttribute("myCartBO", myCartBO);
		}
		String goodsId=request.getParameter("goodsId");
		String type=request.getParameter("type");
		if (type.equals("addGoods")) {
			myCartBO.addGoods(goodsId, "1");
		} else if (type.equals("delGoods")) {
			myCartBO.delGoods(goodsId);
		}else if (type.equals("delAllGoods")) {
			myCartBO.clearGoods();
		}else if (type.equals("updateGoods")) {
			String goodsIdString[]=request.getParameterValues("goodsId");
			String newNumString[]=request.getParameterValues("newNum");
			for (int i = 0; i < goodsIdString.length; i++) {
				myCartBO.updateGoods(goodsIdString[i], newNumString[i]);
			}
		} else if (type.equals("showMyCart")) {
			
		}
		ArrayList<GoodsBean> arrayList=myCartBO.showMyCart();
		request.setAttribute("myCartInfo", arrayList);
		request.getRequestDispatcher("/showMyCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
