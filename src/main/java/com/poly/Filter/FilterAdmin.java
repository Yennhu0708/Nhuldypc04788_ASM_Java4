package com.poly.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constrant.SessionAttr;
import com.poly.entity.User;

 @WebFilter(urlPatterns ={ "/Admin/*", "/VideoList", "/FavoritesAD", "/ShareList", "/UserList", "/edituser", "/EditVideo", "/CreateVideo" })
public class FilterAdmin implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest) request;
	      HttpServletResponse resp = (HttpServletResponse) response;
	      HttpSession session = req.getSession();
	        // Kiểm tra xem người dùng đã đăng nhập làm quản trị viên hay chưa
	        User adminObject = (User) session.getAttribute(SessionAttr.Current_user);
	        if (adminObject != null && adminObject.getIsAdmin() == Boolean.TRUE) {
	        	
	            chain.doFilter(request, response);
	        } else {
	        	resp.sendRedirect("Error");
	        }
	
		
	}
	
}
