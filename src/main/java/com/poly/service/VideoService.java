package com.poly.service;

import java.util.List;

import com.poly.entity.Video;

public interface VideoService {
	Video findById(Integer id);
	Video findByHref(String  href);
	List<Video> findAll();
	List<Video> findAll(int pageNumber, int pageSize);
	Video create (Video entity);
	Video update (Video entity);
	Video delete (String href);

	Video updateVideoEdit(Integer id, String title, String href, String mota, String poster, boolean status);

	Video createNewVideo(String addTitle, String addHref, String addMota, String addPoster, boolean addStatus);
}
