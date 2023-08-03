package com.poly.controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.constrant.SessionAttr;
import com.poly.dio.VideoLikeInfo;
import com.poly.entity.User;
import com.poly.service.StastService;
import com.poly.service.UserService;
import com.poly.service.impl.StastServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet({ "/Admin", "/VideoList", "/FavoritesAD" })
public class HomeADController extends HttpServlet {

	private static final long serialVersionUID = -7576260296437171312L;

	StastService stastService = new StastServiceImpl();
	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		switch (path) {
		case "/Admin":
			doGetAdmin(request, response);
			break;
		case "/VideoList":
			doGetVideoList(request, response);
			break;
		case "/FavoritesAD":
			doGetFavoritesAD(request, response);
			break;
		}
	}

	protected void doGetAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		User currenUser = (User) session.getAttribute(SessionAttr.Current_user);
		if (currenUser != null && currenUser.getIsAdmin() == Boolean.TRUE) {
			List<VideoLikeInfo> videos = stastService.findVideoLikeInfo();
			request.setAttribute("videos", videos);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/Admin/Home.jsp");
			requestDispatcher.forward(request, response);
		} else {
			response.sendRedirect("Index");
		}

	}

	protected void doGetVideoList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<VideoLikeInfo> videos = stastService.findVideoLikeInfo();
		request.setAttribute("videos", videos);
		request.getRequestDispatcher("/views/Admin/listVideoAD.jsp").forward(request, response);
	}

	protected void doGetFavoritesAD(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String videoHref = request.getParameter("href");

		List<VideoLikeInfo> video = stastService.findVideoLikeInfo();

		if (videoHref == null) {
			request.setAttribute("videos", video);
		} else {
			List<User> user = userService.findUsersLikedVideoByVideoHref(videoHref);
			request.setAttribute("user", user);
		}

		request.setAttribute("videoHref", videoHref);
		request.setAttribute("videos", video);
		request.getRequestDispatcher("/views/Admin/favoritesAD.jsp").forward(request, response);
	}

}
