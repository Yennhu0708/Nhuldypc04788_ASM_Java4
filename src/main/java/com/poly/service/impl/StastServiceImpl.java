package com.poly.service.impl;

import java.util.List;

import com.poly.dao.StatsDAO;
import com.poly.dao.impl.StastDaoImpl;
import com.poly.dio.VideoLikeInfo;
import com.poly.service.StastService;

public class StastServiceImpl implements StastService {

	private StatsDAO statsDAO;
	
	public StastServiceImpl() {
		statsDAO = new StastDaoImpl();
	}
	
	
	@Override
	public List<VideoLikeInfo> findVideoLikeInfo() {
		
		return statsDAO.findVideoLikeInfo();
	}

	
}
