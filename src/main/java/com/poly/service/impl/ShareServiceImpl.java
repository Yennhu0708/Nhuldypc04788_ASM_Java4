package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.ShareDao;
import com.poly.dao.impl.ShareDaoImpl;
import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.ShareService;


public class ShareServiceImpl implements ShareService {

	private ShareDao dao;

	public ShareServiceImpl() {
		dao = new ShareDaoImpl();
	}

	@Override
	public List<Share> findByUser(String email) {
		return dao.findByUser(email);
	}

	@Override
	public Share findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public Share create(User user, Video video, String email) {
		Share existShare = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existShare == null) {
			existShare = new Share();
			existShare.setUser(user);
			existShare.setVideo(video);
			existShare.setEmail(email);
			existShare.setShareDate(new Timestamp(System.currentTimeMillis()));
			dao.create(existShare);
		}
		return existShare;
	}
	
}
