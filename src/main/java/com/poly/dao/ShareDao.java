package com.poly.dao;

import java.util.List;

import com.poly.entity.Share;

public interface ShareDao {

	List<Share> findByUser(String username);
	
	Share findByUserIdAndVideoId(Integer userId, Integer videoId);

	Share create(Share entity);

}
