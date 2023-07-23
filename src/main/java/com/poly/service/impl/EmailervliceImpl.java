package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.Util.SendEmailWelcome;
import com.poly.entity.User;
import com.poly.service.EmailService;

public class EmailervliceImpl implements EmailService {
	public static final String EMAIL_WELCOME_SUBJECT = "CHÀO MỪNG BẠN ĐÃ THAM GIA VIETSUB PHIM";
	public static final String EMAIL_FORGOT_PASSWORD = "MÃ XÁC NHẬN TÀI KHOẢN";

	@Override
	public void SendEmail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");

		try {
			String message = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				message = "VIETSUB PHIM - CẢM ƠN BẠN ĐÃ ĐĂNG KÝ !" 
						+ "\r\n"
						+ "Chào mừng " + recipient.getUsername() + " đến với VIETSUB PHIM."
						+ "\r\n"
						+ "Chúng tôi xin chân thành cảm ơn vì bạn đã đăng ký để trở thành thành viên của trang web phim của chúng tôi! Chúng tôi vô cùng phấn khích khi chào đón bạn vào cộng đồng của chúng tôi.\\r\\n"
						+ "\r\n"
						+ "Trang web phim của chúng tôi cam kết cung cấp cho bạn những trải nghiệm giải trí tuyệt vời và đa dạng. Với hàng ngàn bộ phim đa dạng từ các thể loại khác nhau, bạn sẽ có cơ hội khám phá những câu chuyện thú vị và hấp dẫn từ khắp nơi trên thế giới.\r\n"
						+ "\r\n"
						+ "Ngoài ra, chúng tôi cũng cung cấp các tính năng hữu ích như danh sách phim yêu thích, đánh giá và bình luận phim, cùng nhiều nội dung thú vị khác để bạn có thể tận hưởng thời gian thư giãn trọn vẹn trên trang web của chúng tôi.\r\n"
						+ "\r\n"
						+ "Chúng tôi luôn đặt sự hài lòng của bạn lên hàng đầu. Nếu có bất kỳ câu hỏi hoặc góp ý nào, đừng ngần ngại liên hệ với chúng tôi. Đội ngũ hỗ trợ của chúng tôi sẵn lòng hỗ trợ bạn bất cứ lúc nào.\r\n"
						+ "\r\n"
						+ "Chúng tôi hy vọng rằng bạn sẽ tận hưởng thời gian thú vị trên trang web phim của chúng tôi và tìm thấy những bộ phim mà bạn yêu thích. Hãy chia sẻ niềm vui này với bạn bè và gia đình để cùng nhau trải nghiệm không gian giải trí tuyệt vời này.\r\n"
						+ "\r\n"
						+ "Một lần nữa, xin chân thành cảm ơn vì đã đồng hành cùng chúng tôi. Chúc bạn có những trải nghiệm thú vị và ý nghĩa trên trang web phim của chúng tôi!\r\n"
						+ "\r\n" + "Trân trọng,\r\n" + "Ban quản trị trang web phim ";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				message = "Kính gửi"+ recipient.getUsername() 
				+ "\r\n"
				+ "Rất mong rằng bạn đang có một ngày tốt lành. Chúng tôi viết thư này để cung cấp cho bạn mã xác nhận cần thiết để truy cập vào tài khoản của bạn.\r\n"
				+ "\r\n"
				+ "An ninh của bạn là ưu tiên hàng đầu của chúng tôi, và chúng tôi muốn đảm bảo rằng chỉ có những người được ủy quyền mới có thể truy cập vào tài khoản của bạn. Vui lòng tìm mã xác nhận đặc biệt của bạn dưới đây:\r\n"
				+ "\r\n"
				+ "Mã Xác Nhận:"  + recipient.getPassword();
				break;
			default:
				subject = "Email Lỗi";
				message = "Xin Lỗi vì sự bất tiện này";
			}
			SendEmailWelcome.sendEmail(host, port, user, pass, recipient.getEmail(),subject, message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
