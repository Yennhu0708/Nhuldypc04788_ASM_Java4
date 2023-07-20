package com.poly.controller;

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
import com.poly.service.UserService;
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

@WebServlet(urlPatterns = { "/Login", "/Logout", "/Register" })
public class UserController extends HttpServlet {

	private static final long serialVersionUID = -5860351843059541642L;
	private UserService userService = new UserServiceImpl();

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

		}

	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Login.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/User/Register.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		session.removeAttribute(SessionAttr.Current_user);
		resp.sendRedirect("Index");
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
	private void doPostRegister(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email    = request.getParameter("email");

		// Kiểm tra xem username đã tồn tại trong cơ sở dữ liệu chưa
	    if (userService.findByUsername(username) != null) {
	        // Nếu đã tồn tại, xử lý lỗi hoặc thông báo cho người dùng biết
	        // Ví dụ: redirect về trang đăng ký lại và hiển thị thông báo lỗi
	        response.sendRedirect("Register?error=UsernameAlreadyExists");
	        return;
	    }
	    
	    if (userService.findByEmail(email) != null) {
	        // Nếu đã tồn tại, xử lý lỗi hoặc thông báo cho người dùng biết
	        // Ví dụ: redirect về trang đăng ký lại và hiển thị thông báo lỗi
	        response.sendRedirect("Register?error=EmailAlreadyExists");
	        return;
	    }
	    
		User user = userService.create(username, password,email);

		if (user != null) {
			
			// Gửi email đăng kí thành công
	        sendRegistrationEmail(user.getEmail(), user.getUsername());
	        
			session.setAttribute(SessionAttr.Current_user, user);
			response.sendRedirect("Index");
			System.out.println(user.getUsername());	
			System.out.println("Đăng kí thành công!");
		} else {
			response.sendRedirect("Register");
			System.out.println(username);
			System.out.println(password);
		}
	}

	
	private void sendRegistrationEmail(String toEmail, String username){
		final String email = "yennhudesign@gmail.com";		
	final String password = "zxwiuqtnjkotdmfv";
				
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
			message.setSubject("Thông ba");
			message.setText("Ngộ");

			Transport.send(message);

			System.out.println("Done");
			
		} catch (AddressException e) {
			e.printStackTrace();
			
		} catch (MessagingException e) {
			e.printStackTrace();
			
		}
		
	}
//	private void sendRegistrationEmail(String toEmail, String username) {
//		final String email = "yennhudesign@gmail.com";		
//		final String password = "zxwiuqtnjkotdmfv";
//				
//		Properties prop = new Properties();
//
//		prop.put("mail.smtp.host", "smtp.gmail.com");
//		prop.put("mail.smtp.port", "587");
//		prop.put("mail.smtp.auth", "true");
//		prop.put("mail.smtp.starttls.enable", "true");
//
//		Session session = Session.getDefaultInstance(prop, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(email, password);
//			}
//		});
//
//		Message message = new MimeMessage(session);
//		try {
//			message.setFrom(new InternetAddress(email));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
//			message.setSubject("Chào mừng bạn đến với VIETSUB PHIM" );
//			message.setText("Chào mừng "+ username + "đến với VIETSUB PHIM."
//					+ "\r\n"
//					+" Chúng tôi xin chân thành cảm ơn vì bạn đã đăng ký để trở thành thành viên của trang web phim của chúng tôi! Chúng tôi vô cùng phấn khích khi chào đón bạn vào cộng đồng của chúng tôi.\\r\\n"
//					+ "\r\n"
//					+ "Trang web phim của chúng tôi cam kết cung cấp cho bạn những trải nghiệm giải trí tuyệt vời và đa dạng. Với hàng ngàn bộ phim đa dạng từ các thể loại khác nhau, bạn sẽ có cơ hội khám phá những câu chuyện thú vị và hấp dẫn từ khắp nơi trên thế giới.\r\n"
//					+ "\r\n"
//					+ "Ngoài ra, chúng tôi cũng cung cấp các tính năng hữu ích như danh sách phim yêu thích, đánh giá và bình luận phim, cùng nhiều nội dung thú vị khác để bạn có thể tận hưởng thời gian thư giãn trọn vẹn trên trang web của chúng tôi.\r\n"
//					+ "\r\n"
//					+ "Chúng tôi luôn đặt sự hài lòng của bạn lên hàng đầu. Nếu có bất kỳ câu hỏi hoặc góp ý nào, đừng ngần ngại liên hệ với chúng tôi. Đội ngũ hỗ trợ của chúng tôi sẵn lòng hỗ trợ bạn bất cứ lúc nào.\r\n"
//					+ "\r\n"
//					+ "Chúng tôi hy vọng rằng bạn sẽ tận hưởng thời gian thú vị trên trang web phim của chúng tôi và tìm thấy những bộ phim mà bạn yêu thích. Hãy chia sẻ niềm vui này với bạn bè và gia đình để cùng nhau trải nghiệm không gian giải trí tuyệt vời này.\r\n"
//					+ "\r\n"
//					+ "Một lần nữa, xin chân thành cảm ơn vì đã đồng hành cùng chúng tôi. Chúc bạn có những trải nghiệm thú vị và ý nghĩa trên trang web phim của chúng tôi!\r\n"
//					+ "\r\n"
//					+ "Trân trọng,\r\n"
//					+ "Ban quản trị trang web phim ");
//
//			Transport.send(message);
//
//			System.out.println("Done");
//			
//		} catch (AddressException e) {
//			e.printStackTrace();
//			
//		} catch (MessagingException e) {
//			e.printStackTrace();
//			
//		}
//	}
}
