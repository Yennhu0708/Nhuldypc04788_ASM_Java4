package com.poly.dao.impl;

import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.HistoryDAO;
import com.poly.entity.History;

public class HistoryDAOImpl extends AbstractDao<History> implements HistoryDAO {

	@Override
	public List<History> findByUser(String username) {
		String sql = "SELECT o FROM History o WHERE o.User.username = ?0 AND o.video.isActive = 1 "
				+ " ORDER BY o.viewDate DESC";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		String sql = "SELECT o FROM History o WHERE o.User.username = ?0 AND o.isLiked = 1"
				+ "  AND  o.video.isActive = 1 " + " ORDER BY o.viewDate DESC";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public History findUserIdAndVideoId(Integer userId, Integer videoId) {
		String sql = "SELECT o FROM History o WHERE o.User.userId = ?0 AND o.Video.videoId = ?1"
				+ "  AND  o.video.isActive = 1 " + " ORDER BY o.viewDate DESC";
		return super.findOne(History.class,sql, userId, videoId);
	}

}
