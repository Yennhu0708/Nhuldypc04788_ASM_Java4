package com.poly.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constrant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.ShareService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.ShareServiceImpl;
import com.poly.service.impl.VideoServiceImpl;



@WebServlet(urlPatterns = "/video")
public class Videocontroller extends HttpServlet {

	private static final long serialVersionUID = -1824907893005348747L;

	private VideoService videoService = new VideoServiceImpl();

	private HistoryService historyService = new HistoryServiceImpl();
	private ShareService shareService = new ShareServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();

		switch (actionParam) {
		case "watch":
			doGetWatch(session, href, req, resp);
			break;
		case "like":
			doGetLike(session, href, req, resp);
			break;

		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();

		switch (path) {
		case "/video":
			doPostShare(request, response);
			break;
		}
	}

	// localhosst:8080/Nhuldypc04788_ASM_SOF301/video?action=watch&id={href}
	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);

		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);

		if (currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikeBtn", history.getIsLiked());
		}

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Video-detail.jsp");
		requestDispatcher.forward(req, resp);
	}

	// localhosst:8080/Nhuldypc04788_ASM_SOF301/video?action=like&id={href}

	private void doGetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("aplication/json");
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);
		boolean result = historyService.updateLikeOrUnlike(currentUser, href);
		if (result == true) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}
	protected void doPostShare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		System.out.println(session);
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		String username = user.getUsername();
		System.out.println(username);
		String videoTitle = request.getParameter("sharetitle");
		String shareEmail = request.getParameter("toEmail");
		String shareHref = request.getParameter("sharehref");
		System.out.println(shareHref);

		if (shareEmail != null && shareHref != null) {
			Video video = videoService.findByHref(shareHref);
			Share share = shareService.create(user, video, shareEmail);
			if (share != null) {
				String subjectShare = "VIETSUB PHIM - " + videoTitle;
				String contentShare = "Bạn vừa được chia sẻ bộ phim " + videoTitle + ". Hãy bấm vào link sau để theo dõi bộ phim này nhé. Trân trọng! \n"
						+ "http://localhost:8080/Ogani_PC04763_ASM/video?action=watch&id="+shareHref;
				sendShareEmail(shareEmail, subjectShare, contentShare);
				
				//SendEmailShareVideo.SendMail(session, request, response, email, fullname, videoTitle, href, note);
				
				response.sendRedirect("video?action=watch&id=" + shareHref);
			}
		}
	}
	private void sendShareEmail(String toEmail, String subject, String content) {
        // Tương tự như hàm gửi email đã thực hiện trong UserServiceImpl
        // Gửi mã xác nhận đến email người dùng ở đây
    	final String email = "nhuldypc04788@fpt.edu.vn";
		final String password = "ijuijvvycvtoeiyf";

		Properties prop = new Properties();

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(subject);
			message.setText(content);

			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
}
