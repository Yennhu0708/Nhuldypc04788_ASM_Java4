package com.poly.dao;

import java.util.List;
import java.util.Map;

import com.poly.entity.User;

public interface UserDAO {

	User findById(Integer id);
	User findByEmail(String email);
	User findByUsername(String username);
	User findByPassword(String password);
	User findByUsernameandPassword(String username, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create (User entity);
	User update (User entity);
	User delete (User entity);
	List<User> findAllTwo();
	List<User> findUsersLikedVideoByVideoHref(Map<String, Object> params);
	List<User> UserShareVideoByHref(Map<String, Object> params);
}
