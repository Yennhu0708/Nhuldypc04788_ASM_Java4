package com.poly.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.StatsDAO;
import com.poly.dio.VideoLikeInfo;

public class StastDaoImpl extends AbstractDao<Object[]> implements StatsDAO{

	@Override
	public List<VideoLikeInfo> findVideoLikeInfo() {
			String sql = "Select v.id, v.title, v.href, sum(cast(h.isLiked as int)) as totalLike "
					+ "From Video v left join history h on v.id = h.videoId "
					+ "where v.isActive = 1 "
					+ "group by v.id, v.title, v.href "
					+ "order by sum(cast(h.isLiked as int)) desc ";
			List<Object[]> objects = super.findManyByNativeQuery(sql);
			List<VideoLikeInfo> result = new ArrayList<>();
			objects.forEach(object -> {
				VideoLikeInfo videoLikeInfo = setDataVideoLikeInfo(object);
				
				result.add(videoLikeInfo);
			});
			return result;
	}
	
	
	
	
	
	//hàm để set Data
	private VideoLikeInfo setDataVideoLikeInfo(Object[] object) {
		VideoLikeInfo videoLikeInfo = new VideoLikeInfo();
		videoLikeInfo.setVideoId((Integer)object[0]);
		videoLikeInfo.setTille((String)object[1]);
		videoLikeInfo.setHref((String)object[2]);
		videoLikeInfo.setTotalLike(object[3] == null ? 0 :(Integer) object[3]);
		return videoLikeInfo;
		
	}

}
