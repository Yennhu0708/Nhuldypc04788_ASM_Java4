package com.poly.service;

import javax.servlet.ServletContext;

import com.poly.entity.User;

public interface EmailService  {
	 public void SendEmail(ServletContext context, User recipient, String type); 
	 }
 