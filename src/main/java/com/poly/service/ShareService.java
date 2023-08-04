package com.poly.service;

import java.util.List;

import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;



public interface ShareService {
	
	List<Share> findByUser(String username);

	Share findByUserIdAndVideoId(Integer userId, Integer videoId);

	Share create(User user, Video video, String email);
	
}
