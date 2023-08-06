package com.poly.controller;

import java.io.IOException;

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

@WebServlet(urlPatterns = { "/Login", "/Logout", "/Register", "/Forgotpassword", "/ChangePass", "/EditProfile", "/Profile"})
public class UserController extends HttpServlet {

	private static final long serialVersionUID = -5860351843059541642L;
	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailervliceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = request.getServletPath();
		switch (path) {
		case "/Login":
			doGetLogin(request, response);
			break;
		case "/Register":
			doGetRegister(request, response);
			break;
		case "/Forgotpassword":
			doGetForgotpassword(request, response);
			break;
		case "/ChangePass":
			doGetChangePass(request, response);
			break;
		case "/Profile":
			doGetProfile(session, request, response);
			break;
		case "/EditProfile":
			doGetEditProfile(session, request, response);
			break;
		case "/Logout":
			doGetLogout(session, request, response);
			break;

		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = request.getServletPath();
		switch (path) {
		case "/Login":
			doPostLogin(session, request, response);
			break;
		case "/Register":
			doPostRegister(session, request, response);
			break;
		case "/Forgotpassword":
			doPostForgotpassword(request, response);
			break;
		case "/ChangePass":
			doPostChangePass(session, request, response);
			break;
		case "/EditProfile":
			doPostEditProfile(session, request, response);
			break;

		}

	}

	// Đăng Nhập
	private void doGetLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/User/Login.jsp");
		requestDispatcher.forward(request, response);
	}

	private void doPostLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
			session.setAttribute(SessionAttr.Current_user, user);
			response.sendRedirect("Index");
		} else {
			response.sendRedirect("Login");

		}

	}

//Đăng Ký
	private void doGetRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/User/Register.jsp");
		requestDispatcher.forward(request, response);
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
	private void doGetForgotpassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/User/Forgotpassword.jsp");
		requestDispatcher.forward(request, response);
	}

	private void doPostForgotpassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");

		String email = request.getParameter("email");

		User userWithNewPass = userService.resetPassword(email);
		if (userWithNewPass != null) {
			emailService.SendEmail(getServletContext(), userWithNewPass, "forgot");
			response.setStatus(204);
		} else {
			response.setStatus(400);
		}

	};

	// Đổi Mật Khẩu
	private void doGetChangePass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/User/ChangePass.jsp");
		requestDispatcher.forward(request, response);
	};

	private void doPostChangePass(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String oldPass = currentUser.getPassword();

		if (oldPass.equals(oldPassword)) {

			User user = userService.changePassword(oldPassword, newPassword);

			if (user != null) {

				session.removeAttribute(SessionAttr.Current_user);
				response.sendRedirect("Login");
			} else {
				response.sendRedirect("ChangePass");
			}
		} else {
			response.sendRedirect("ChangePass");
		}

	}

	//Hiển thị thông tin
	private void doGetProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		System.out.println(user);
		
		String username = user.getUsername();
		String email = user.getEmail();
		Boolean status = user.getIsActive();
		String trangthai = "";
		if(status == true ) {
			trangthai = "Đang hoạt động";
		}else {
			trangthai = "Ngừng hoạt động";
		}
		request.setAttribute("username", username);
		request.setAttribute("email", email);
		request.setAttribute("status", trangthai);
		request.getRequestDispatcher("/views/User/Profile.jsp").forward(request, response);
	}

	// Đăng Xuất
	private void doGetLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session.removeAttribute(SessionAttr.Current_user);
		request.getRequestDispatcher("/views/User/Index.jsp").forward(request, response);
	}
	
	
	// Chỉnh sửa thông tin
		private void doGetEditProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			User user = (User) session.getAttribute(SessionAttr.Current_user);
			System.out.println("Check edit: " + user);
//			
			String username = user.getUsername();
			String password = user.getPassword();
			String email = user.getEmail();
			
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			
			request.getRequestDispatcher("/views/User/Edit-profile.jsp").forward(request, response);
		}
		// Chỉnh sửa thông tin
		private void doPostEditProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			
			User chkMail = userService.findByEmail(email);
			if(chkMail != null){
				response.sendRedirect("EditProfile?error=TrungMail");
				return;
			}
			
			if (username != null && password != null && email != null) {
		        // Assuming userService handles user-related operations
		        User user = userService.updateProfileUser(username, password, email);

		        if (user != null) {
		            // Check if the email has changed
		            String currentEmail = (String) session.getAttribute("email");
		            if (currentEmail != null && currentEmail.equals(email)) {
		                // Ko đổi gì thì về lại profile 
		                response.sendRedirect("Profile");
		            } else {
		                // Thay đổi thì về index 
		                response.sendRedirect("Index");
		            }
		        } else {
		            response.sendRedirect("EditProfile");
		        }
		    }
			
		}
		
		
		
		
}