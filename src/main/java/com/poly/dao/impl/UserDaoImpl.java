package com.poly.dao.impl;

import java.util.List;
import java.util.Map;

import com.poly.constrant.nameStored;
import com.poly.dao.AbstractDao;
import com.poly.dao.UserDAO;
import com.poly.entity.User;

public class UserDaoImpl extends AbstractDao<User> implements UserDAO {

	@Override
	public User findById(Integer id) {

		return super.findById(User.class, id);
	}

	@Override
	public User findByEmail(String email) {
		String sql = "SELECT o FROM User o WHERE o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByUsername(String username) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0";
		return super.findOne(User.class, sql, username);
	}

	@Override
	public User findByUsernameandPassword(String username, String password) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0 AND o.password = ?1";
		return super.findOne(User.class, sql, username, password);

	}

	@Override
	public List<User> findAll() {
		return super.findAll(User.class, true);
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		return super.findAll(User.class, true, pageNumber, pageSize);
	}

	@Override
	public User findByPassword(String password) {
		String sql = "SELECT o FROM User o WHERE o.password = ?0";
		return super.findOne(User.class, sql, password);
	}

	@Override
	public User create(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User update(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User delete(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAllTwo() {
		return super.findAllTwo(User.class);
	}

	@Override
	public List<User> findUsersLikedVideoByVideoHref(Map<String, Object> params) {
		return super.callStored(nameStored.FIND_USER_LIKED_VIDEO_BY_VIDEO_HREF, params);
		
	}

}
