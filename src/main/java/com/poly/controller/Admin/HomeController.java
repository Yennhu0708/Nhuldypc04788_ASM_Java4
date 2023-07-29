package com.poly.controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.service.StastService;
import com.poly.service.impl.StastServiceImpl;

@WebServlet(urlPatterns = "/Admin", name = "HomeControllerAmind")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = -7576260296437171312L;
	
	
	private StastService stastService = new StastServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/Admin/Home.jsp");
			requestDispatcher.forward(request, response);
	}


}
