package com.poly.controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constrant.SessionAttr;
import com.poly.dio.VideoLikeInfo;
import com.poly.entity.User;
import com.poly.service.StastService;
import com.poly.service.impl.StastServiceImpl;

@WebServlet(urlPatterns = "/Admin", name = "HomeControllerAmind")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = -7576260296437171312L;
	
	
	private StastService stastService = new StastServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currenUser = (User) session.getAttribute(SessionAttr.Current_user);
		if(currenUser != null && currenUser.getIsAdmin() == Boolean.TRUE) {
			List<VideoLikeInfo> videos = stastService.findVideoLikeInfo();
			request.setAttribute("videos", videos);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/Admin/Home.jsp");
			requestDispatcher.forward(request, response);
		}else {
			response.sendRedirect("Index");
		}
			
	}


}
