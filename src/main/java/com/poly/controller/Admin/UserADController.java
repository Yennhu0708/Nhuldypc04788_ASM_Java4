package com.poly.controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.persistence.Id;
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
import com.poly.service.UserService;
import com.poly.service.impl.StastServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet({ "/UserList", "/edituser" })
public class UserADController extends HttpServlet {

	private static final long serialVersionUID = -7576260296437171312L;

	StastService stastService = new StastServiceImpl();
	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		switch (path) {
		case "/UserList":
			doGetUserList(request, response);
			break;
		case "/edituser":
			doGetEditUser(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();

		switch (path) {

		case "/edituser":
			doPostEditUser(request, response);
			break;

		/*
		 * case "/deleteuser": doPostDeleteUser(request, response); break;
		 */
		}
	}

	protected void doGetUserList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> users = userService.findAllTwo();

		request.setAttribute("users", users);
		request.getRequestDispatcher("/views/Admin/ListUserAD.jsp").forward(request, response);
	}

//	chỉnh sửa người dùng
	protected void doGetEditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userIdParam = request.getParameter("id");

		if (userIdParam != null && !userIdParam.isEmpty()) {
			try {
				int userId = Integer.parseInt(userIdParam);
				User user = userService.findById(userId);

				if (user != null) {
					request.setAttribute("user", user);
					request.getRequestDispatcher("/views/Admin/EditUserAD.jsp").forward(request, response);
				} else {
					response.getWriter().write("Người dùng không tồn tại!");
				}
			} catch (NumberFormatException e) {
				response.getWriter().write("Định danh người dùng không hợp lệ!");
			}
		} else {
			response.getWriter().write("Thiếu định danh người dùng!");
		}

	}

	protected void doPostEditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String getStatus = request.getParameter("status");
		Boolean newStatus = Boolean.parseBoolean(getStatus); 
		    
		if (username != null && password != null && email != null) {
			User user = userService.updateEditUser(username, password, email, newStatus);

			if (user != null) {

				response.sendRedirect("UserList");
			} else {
				response.sendRedirect("edituser");
			}
		}
		
	}

}
