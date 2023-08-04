package com.poly.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.poly.dao.UserDAO;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.entity.User;
import com.poly.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO dao;

	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public User findByPassword(String password) {
		return dao.findByPassword(password);
	}

	@Override
	public User login(String username, String password) {
		// Giải mã password
		return dao.findByUsernameandPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		User existUser = findByEmail(email);
		if (existUser != null) {
			String newPass = String.valueOf((int) (Math.random() * ((9999 - 1000) + 1) + 1000));
			existUser.setPassword(newPass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public User changePassword(String password, String newPass) {
		User user = findByPassword(password);
		if (user != null) {
			user.setPassword(newPass);
			return dao.update(user);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User create(String username, String password, String email) {
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setPassword(password); // Có Thể mã hóa bcrypt md5
		newUser.setEmail(email);
		newUser.setIsAdmin(Boolean.FALSE);
		newUser.setIsActive(Boolean.TRUE);
		return dao.create(newUser);
	}

	@Override
	public User updateEditUser(String username, String password, String email,boolean newStatus) {
		User user = findByUsername(username);
		user.setEmail(email);
		user.setIsActive(newStatus);
		return dao.update(user);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		return dao.update(user);
	}

	@Override
	public User update(User entity) {
		return update(entity);
	}

	@Override
	public List<User> findAllTwo() {
		return dao.findAllTwo();
	}

	@Override
	public List<User> findUsersLikedVideoByVideoHref(String href) {
		Map<String, Object> params = new HashMap<>();
		params.put("videoHref", href);
		return dao.findUsersLikedVideoByVideoHref(params);
	}

	@Override
	public List<User> UserShareVideoByHref(String href) {
		Map<String, Object> params = new HashMap<>();
		params.put("videoHref", href);
		return dao.UserShareVideoByHref(params);
	}

	
}
