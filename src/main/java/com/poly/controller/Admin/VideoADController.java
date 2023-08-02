package com.poly.controller.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet({"/EditVideo","/CreateVideo"})
public class VideoADController extends HttpServlet {

	private static final long serialVersionUID = 8444830156066277312L;
	private VideoService videoService = new VideoServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = request.getServletPath();
		
		switch (path) {
		case "/EditVideo":
			doGetVideoEdit(request, response);
			break;
			
		case "/CreateVideo":
			doGetVideoNew(request, response);
			break;
			}
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String path = request.getServletPath();

			switch (path) {
			case "/EditVideo":
				doPostVideoEdit(request, response);
				break;
				
			case "/CreateVideo":
				doPostVideoNew(request, response);
				break;
				
			}
		}
		protected void doGetVideoEdit(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			String videoIdParam = request.getParameter("id");
			
//			List<VideoLikedInfo> videolike = statsService.findVideoLikedInfo();
//			request.setAttribute("videos", videolike);
			
		    if (videoIdParam != null && !videoIdParam.isEmpty()) {
		        try {
		            int videoId = Integer.parseInt(videoIdParam);
		            Video video = videoService.findById(videoId);          

		            if (video != null) {
		                request.setAttribute("video", video);
		                System.out.println(video.getDescription());
		                request.getRequestDispatcher("/views/Admin/EditVideoAD.jsp").forward(request, response);
		            } else {
		                System.out.println("Not Exist!");
			        	request.getRequestDispatcher("/views/Admin/EditVideoAD.jsp").forward(request, response);
		            }
		        } catch (NumberFormatException e) {
		        	System.out.println("Invalid!");
		        	request.getRequestDispatcher("/views/Admin/EditVideoAD.jsp").forward(request, response);
		        }
		    } else {
		    	System.out.println("Not found ID!");
		        request.getRequestDispatcher("/views/Admin/EditVideoAD.jsp").forward(request, response);
		    }

		}
		
		
		protected void doPostVideoEdit(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			Integer chkId = Integer.parseInt(request.getParameter("id"));
			String newTitle = request.getParameter("title");
			String newHref = request.getParameter("href");		
			String newMota = request.getParameter("description");
			String newPoster = request.getParameter("poster");
			
			String getStatus = request.getParameter("status");
			
		    boolean newStatus = Boolean.parseBoolean(getStatus);
		    
		    System.out.println(chkId+" "+newTitle+" "+newHref+" "+newMota+" "+newPoster+" "+newStatus);
		    	    

			if (newTitle != null && newHref != null && newMota != null && newPoster != null) {
				Video videoEdit = videoService.updateVideoEdit(chkId, newTitle, newHref, newMota, newPoster, newStatus);
				if (videoEdit != null) {
					response.sendRedirect("VideoList");
				}else {
					request.getRequestDispatcher("EditVideo");
				}
			}
			
		}
		
		protected void doGetVideoNew(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
		        request.getRequestDispatcher("/views/Admin/createVideo.jsp").forward(request, response);
		 
		}
		
		protected void doPostVideoNew(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			String addTitle = request.getParameter("title");
			String addHref = request.getParameter("href");		
			String addMota = request.getParameter("description");
			String addPoster = request.getParameter("poster");
			
			String getStatus = request.getParameter("status");
			
		    boolean addStatus = Boolean.parseBoolean(getStatus);
		    
		    System.out.println(addTitle+" "+addHref+" "+addMota+" "+addPoster+" "+addStatus);
		    

			if (addTitle != null && addHref != null && addMota != null && addPoster != null && getStatus != null ) {
				
				Video videosHref = videoService.findByHref(addHref);

				if (videosHref == null) {
					Video videosCreate = videoService.createNewVideo(addTitle, addHref, addMota, addPoster, addStatus);
					if (videosCreate != null) {
						response.sendRedirect("VideoList");
						
					}
				} else {
					response.sendRedirect("EditVideo");				
				}
			}
			
		}
		

}
