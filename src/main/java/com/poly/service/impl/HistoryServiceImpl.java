package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDAO;
import com.poly.dao.impl.HistoryDAOImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl  implements HistoryService{

	private HistoryDAO dao;
	private VideoService videoService = new VideoServiceImpl();
	
	public HistoryServiceImpl() {
		dao = new HistoryDAOImpl();
	}
	
	@Override
	public List<History> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History history = new History();
		history.setUser(user);
		history.setVideo(video);
		history.setIsLiked(Boolean.FALSE);
		return dao.create(history);
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History existHistory = findUserIdAndVideoId(user.getId(), video.getId());
		
		if(existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
		}else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setIsLiked(null);
		}
		
		History updateHistory =dao.update(existHistory);
		return updateHistory != null ? true : false ;
	}
	
}
