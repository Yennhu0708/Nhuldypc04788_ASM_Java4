package com.poly.dao;

import java.util.List;

import com.poly.entity.User;

public interface UserDAO {

	User findById(Integer id);
	User findByEmail(String email);
	User findByUsername(String username);
	User findByUsernameandPassword(String username, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create (User entity);
	User update (User entity);
	User delete (User entity);
}
