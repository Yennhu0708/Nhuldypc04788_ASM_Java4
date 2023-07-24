package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constrant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/Index", "/Favorites", "/History" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1517115637537021552L;
	private static final int VIDEO_MAX_PAGE_SIZE = 6;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService  historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		String path = req.getServletPath();

		switch (path) {
		case "/Index":
			doGetIndex(req, resp);
			break;
			
		case "/Favorites":
			doGetFavorites(session, req, resp);
			break;
			
		case "/History":
			doGetHistory(session, req, resp);
			break;
		}
//		List<Video> videos = videoService.findAll();
//		req.setAttribute("videos", videos);
//		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Index.jsp");
//		requestDispatcher.forward(req, resp);

	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
			List<Video> countVideo = videoService.findAll();
			int maxPage = (int) Math.ceil(countVideo.size()/(double)VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("maxPage", maxPage);
			
		List<Video> videos ;
		String pageNum = req.getParameter("page");
		
		if (pageNum == null || Integer.valueOf(pageNum) > maxPage ) {
				videos = videoService.findAll(1,VIDEO_MAX_PAGE_SIZE);
				req.setAttribute("currentPage", 1);
		}else {
			videos = videoService.findAll(Integer.valueOf(pageNum),VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNum));
		}
		
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/User/Index.jsp").forward(req, resp);
		
	}
	private void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		List<History> histories =  historyService.findByUserAndIsLiked(user.getUsername());
		System.out.println(histories);
		List<Video> videos = new ArrayList<>();
		for (int i = 0; i < histories.size(); i++) {
			videos.add(histories.get(i).getVideo());
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/User/Favorites.jsp").forward(req, resp);
		
	}
	private void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		List<History> histories = historyService.findByUser(user.getUsername());
		List<Video> videos = new ArrayList<>();

		for (int i = 0; i < histories.size(); i++) {
			videos.add(histories.get(i).getVideo());
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/User/History.jsp").forward(req, resp);

		
	}

	
}
