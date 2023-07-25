package com.poly.controller;

import java.io.Console;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constrant.SessionAttr;
import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.service.UserService;
import com.poly.service.impl.EmailervliceImpl;
import com.poly.service.impl.UserServiceImpl;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet(urlPatterns = { "/Login", "/Logout", "/Register", "/Forgotpassword", "/ChangePass", "/Profile" })
public class UserController extends HttpServlet {

	private static final long serialVersionUID = -5860351843059541642L;
	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailervliceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/Login":
			doGetLogin(req, resp);
			break;
		case "/Register":
			doGetRegister(req, resp);
			break;
		case "/Forgotpassword":
			doGetForgotpassword(req, resp);
			break;
		case "/ChangePass":
			doGetChangePass(req, resp);
			break;
		case "/Profile":
			doGetProfile(session, req, resp);
			break;
		case "/Logout":
			doGetLogout(session, req, resp);
			break;

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/Login":
			doPostLogin(session, req, resp);
			break;
		case "/Register":
			doPostRegister(session, req, resp);
			break;
		case "/Forgotpassword":
			doPostForgotpassword(req, resp);
			break;
		case "/ChangePass":
			doPostChangePass(session, req, resp);
			break;

		}

	}

	// Đăng Nhập
	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Login.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
			session.setAttribute(SessionAttr.Current_user, user);
			resp.sendRedirect("Index");
		} else {
			resp.sendRedirect("Login");

		}

	}

//Đăng Ký
	private void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Register.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doPostRegister(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		if (userService.findByUsername(username) != null) {

			response.sendRedirect("Register?error=UsernameAlreadyExists");
			return;
		}

		if (userService.findByEmail(email) != null) {

			response.sendRedirect("Register?error=EmailAlreadyExists");
			return;
		}

		User user = userService.create(username, password, email);

		if (user != null) {

			// Gửi email đăng kí thành công
			emailService.SendEmail(getServletContext(), user, "welcome");

			session.setAttribute(SessionAttr.Current_user, user);
			response.sendRedirect("Index");
		} else {
			response.sendRedirect("Register");
			System.out.println(username);
			System.out.println(password);
		}
	}

	// Quên Mật Khẩu
	private void doGetForgotpassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Forgotpassword.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doPostForgotpassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");

		String email = req.getParameter("email");

		User userWithNewPass = userService.resetPassword(email);
		if (userWithNewPass != null) {
			emailService.SendEmail(getServletContext(), userWithNewPass, "forgot");
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}

	};

	// Đổi Mật Khẩu
	private void doGetChangePass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/ChangePass.jsp");
		requestDispatcher.forward(req, resp);
	};

	private void doPostChangePass(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);

		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String oldPass = currentUser.getPassword();

		if (oldPass.equals(oldPassword)) {

			User user = userService.changePassword(oldPassword, newPassword);

			if (user != null) {

				session.removeAttribute(SessionAttr.Current_user);
				resp.sendRedirect("Login");
			} else {
				resp.sendRedirect("ChangePass");
			}
		} else {
			resp.sendRedirect("ChangePass");
		}

	}

	// Chỉnh sửa thông tin
	private void doGetProfile(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		System.out.println(user);
		
		String username = user.getUsername();
		String email = user.getEmail();
		
		req.setAttribute("username", username);
		req.setAttribute("email", email);
		req.getRequestDispatcher("/views/User/Profile.jsp").forward(req, resp);
	}

	// Đăng Xuất
	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		session.removeAttribute(SessionAttr.Current_user);
		req.getRequestDispatcher("/views/User/Index.jsp").forward(req, resp);
	}

}