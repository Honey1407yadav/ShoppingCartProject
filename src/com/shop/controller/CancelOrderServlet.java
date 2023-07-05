package com.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.OrderDao;
import com.shop.utils.ConnectionProvider;

@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    PrintWriter out = response.getWriter();
			int id = Integer.parseInt(request.getParameter("id"));
			try {
			if(id!=0) {
				OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
				orderDao.cancelOrder(id);
			}
			
			response.sendRedirect("orders.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
