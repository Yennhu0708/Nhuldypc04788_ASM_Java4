package com.poly.Filter;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class UTF8 implements Filter  {

@Override

public void doFilter(ServletRequest request, ServletResponse response, FilterChain reChain)
		throws IOException, ServletException {
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	reChain.doFilter(request, response);
}
}
