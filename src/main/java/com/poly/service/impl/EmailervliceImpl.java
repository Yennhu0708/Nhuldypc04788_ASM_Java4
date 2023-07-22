package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.Util.SendEmailWelcome;
import com.poly.entity.User;
import com.poly.service.EmailService;

public class EmailervliceImpl implements EmailService  {
	public static final String EMAIL_WELCOME_SUBJECT = "CHÀO MỪNG BẠN ĐÃ THAM GIA VIETSUB PHIM";
	public static final String EMAIL_FORGOT_PASSWORD = "ĐỔI MẬT KHẨU";

	@Override
	public void SendEmail(ServletContext context, User recipient, String username) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		try {
			String subject = "VIETSUB PHIM - CẢM ƠN BẠN ĐÃ ĐĂNG KÝ !";
			String message = "Chào mừng "+ username + "đến với VIETSUB PHIM." + "\r\n"
							 +"Chúng tôi xin chân thành cảm ơn vì bạn đã đăng ký để trở thành thành viên của trang web phim của chúng tôi! Chúng tôi vô cùng phấn khích khi chào đón bạn vào cộng đồng của chúng tôi.\\r\\n"
							 + "\r\n" +
							 "Trang web phim của chúng tôi cam kết cung cấp cho bạn những trải nghiệm giải trí tuyệt vời và đa dạng. Với hàng ngàn bộ phim đa dạng từ các thể loại khác nhau, bạn sẽ có cơ hội khám phá những câu chuyện thú vị và hấp dẫn từ khắp nơi trên thế giới.\r\n"
							 + "\r\n" +
							 "Ngoài ra, chúng tôi cũng cung cấp các tính năng hữu ích như danh sách phim yêu thích, đánh giá và bình luận phim, cùng nhiều nội dung thú vị khác để bạn có thể tận hưởng thời gian thư giãn trọn vẹn trên trang web của chúng tôi.\r\n"
							 + "\r\n" +
							 "Chúng tôi luôn đặt sự hài lòng của bạn lên hàng đầu. Nếu có bất kỳ câu hỏi hoặc góp ý nào, đừng ngần ngại liên hệ với chúng tôi. Đội ngũ hỗ trợ của chúng tôi sẵn lòng hỗ trợ bạn bất cứ lúc nào.\r\n"
							  + "\r\n" +
							 "Chúng tôi hy vọng rằng bạn sẽ tận hưởng thời gian thú vị trên trang web phim của chúng tôi và tìm thấy những bộ phim mà bạn yêu thích. Hãy chia sẻ niềm vui này với bạn bè và gia đình để cùng nhau trải nghiệm không gian giải trí tuyệt vời này.\r\n"
							 + "\r\n" +
							  "Một lần nữa, xin chân thành cảm ơn vì đã đồng hành cùng chúng tôi. Chúc bạn có những trải nghiệm thú vị và ý nghĩa trên trang web phim của chúng tôi!\r\n"
							 + "\r\n" + "Trân trọng,\r\n" + "Ban quản trị trang web phim ";
							 
			SendEmailWelcome.sendEmail(host, port, user, pass, recipient.getEmail(), subject, message);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
