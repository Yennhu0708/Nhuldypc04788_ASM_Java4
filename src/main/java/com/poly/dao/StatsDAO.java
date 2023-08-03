package com.poly.dao;

import java.util.List;

import com.poly.dio.VideoLikeInfo;
import com.poly.entity.User;

public interface StatsDAO {
	List<VideoLikeInfo> findVideoLikeInfo();
}
