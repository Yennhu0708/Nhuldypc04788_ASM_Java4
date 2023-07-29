package com.poly.dao;

import java.util.List;

import com.poly.dio.VideoLikeInfo;

public interface StatsDAO {
	List<VideoLikeInfo> findVideoLikeInfo();
}
