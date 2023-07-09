package com.poly.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = "/video")
public class Videocontroller extends HttpServlet {

	private static final long serialVersionUID = -1824907893005348747L;

	private VideoService videoService = new VideoServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();

		switch (actionParam) {
			case "watch":
				doGetWatch(session, href, req, resp);

		}
	}
	// localhosst:8080/Nhuldypc04788_ASM_SOF301/video?action=watch&id={href}
	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Video-detail.jsp");
		requestDispatcher.forward(req, resp);
	}
	// localhosst:8080/Nhuldypc04788_ASM_SOF301/video?action=like&id={href}

}
